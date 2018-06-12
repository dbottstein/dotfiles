function oh_my_git_info {
	local -a oh_my_git_string;

	# Early return if git repo is configured to be hidden
	#if [[ "$(git config --get oh-my-git.enabled)" != "true" ]]; then return; fi

	# Git info
	local current_commit_hash=$(git rev-parse HEAD 2> /dev/null)
	if [[ -n $current_commit_hash ]]; then local is_a_git_repo=true; else local is_a_git_repo=false; fi
	
	if [[ $is_a_git_repo == true ]]; then
		local current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
		if [[ $current_branch == 'HEAD' ]]; then local detached=true; else local detached=false; fi
	
		local number_of_logs=$(git log --pretty=oneline -n1 2> /dev/null | wc -l | tr -d ' ')
		if [[ $number_of_logs -eq 0 ]]; then
			local just_init=true
		else
			local upstream=$(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} 2> /dev/null)
			if [[ -n "${upstream}" && "${upstream}" != "@{upstream}" ]]; then local has_upstream=true; else local has_upstream=false; fi

			local git_status="$(git status --porcelain 2> /dev/null)"
			modifications=$(grep -c '^.M' <<< "$git_status")
			modifications_cached=$(grep -c '^M' <<< "$git_status")
			deletions=$(grep -c '^.D' <<< "$git_status")
			deletions_cached=$(grep -c '^D' <<< "$git_status")
			adds=$(grep -c '^A' <<< "$git_status")
			untracked=$(grep -c '^??' <<< "$git_status")
			conflicts=$(grep -c '^U' <<< "$git_status")

			unstaged=$(( modifications + deletions + untracked ))
			staged=$(( modifications_cached + adds + deletions_cached ))
		
			if [[ $staged -gt 0 && ! $unstaged -eq 0 ]]; then local ready_to_commit=true; else local ready_to_commit=false; fi
		
			local tag_at_current_commit=$(git describe --exact-match --tags $current_commit_hash 2> /dev/null)
			local has_diverged=false
			local can_fast_forward=false
		
			if [[ $has_upstream == true ]]; then
				local commits_diff="$(git log --pretty=oneline --topo-order --left-right ${current_commit_hash}...${upstream} 2> /dev/null)"
				local commits_ahead=$(grep -c "^<" <<< "$commits_diff");
				local commits_behind=$(grep -c "^>" <<< "$commits_diff");
			fi
			if [[ $commits_ahead -gt 0 && $commits_behind -gt 0 ]]; then
				local has_diverged=true
			fi
			if [[ $commits_ahead -eq 0 && $commits_behind -gt 0 ]]; then
				local can_fast_forward=true
			fi
		
			local will_rebase=$(git config --get branch.${current_branch}.rebase 2> /dev/null)
		
			if [[ -f ${GIT_DIR:-.git}/refs/stash ]]; then
				local stashes=$(wc -l 2> /dev/null < ${GIT_DIR:-.git}/refs/stash | tr -d ' ')
			else
				local stashes=0
			fi
		fi
	fi

	if [[ ${is_a_git_repo} == true ]]; then
		oh_my_git_string=(
			"${stashes}"
			"${untracked}"
			"${adds}"
			"${deletions}"
			"${deletions_cached}"
			"${modifications}"
			"${modifications_cached}"
			"${staged}"
			"${unstaged}"
			"${conflicts}"
			"${ready_to_commit}"
			"${detached}"
			"${has_upstream}"
		);
		
		if [[ ${detached} == true ]]; then
			if [[ ${just_init} == true ]]; then
				oh_my_git_string+="detached";
			else
				oh_my_git_string+="${current_commit_hash:0:7}";
			fi
		else
			if [[ $has_upstream == true ]]; then
				oh_my_git_string+=(
					"${has_diverged}"
					"${commits_behind}"
					"${commits_ahead}"
					"${current_branch}"
					"${upstream//\/$current_branch/}"
				);
		
			else
				oh_my_git_string+=( "${current_branch}" "${tag_at_current_commit}" );
			fi
		fi
	fi

	echo -n ${oh_my_git_string}
}


# based on bash __git_ps1 to read branch and current action
function git_current_action () {
	local info="$(git rev-parse --git-dir 2>/dev/null)"
	if [ -n "$info" ]; then
		local action
		if [ -f "$info/rebase-merge/interactive" ]
			then
			action=${is_rebasing_interactively:-"REBASE-i"}
		elif [ -d "$info/rebase-merge" ]
			then
			action=${is_rebasing_merge:-"REBASE-m"}
		else
			if [ -d "$info/rebase-apply" ]
				then
				if [ -f "$info/rebase-apply/rebasing" ]
					then
					action=${is_rebasing:-"REBASE"}
				elif [ -f "$info/rebase-apply/applying" ]
					then
					action=${is_applying_mailbox_patches:-"|AM"}
				else
					action=${is_rebasing_mailbox_patches:-"AM/REBASE"}
				fi
			elif [ -f "$info/MERGE_HEAD" ]
				then
				action=${is_merging:-"MERGING"}
			elif [ -f "$info/CHERRY_PICK_HEAD" ]
				then
				action=${is_cherry_picking:-"CHERRY-PICKING"}
			elif [ -f "$info/BISECT_LOG" ]
				then
				action=${is_bisecting:-"BISECTING"}
			fi  
		fi
		
		if [[ -n $action ]]; then printf "%s" "${1-}$action${2-}"; fi
	fi
}

