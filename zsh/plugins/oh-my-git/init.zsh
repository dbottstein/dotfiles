# A variation of oh-my-git based on the good work of
# 	arialdomartini (https://github.com/arialdomartini/oh-my-git)
# 	bric3 (https://github.com/bric3/oh-my-zsh-git)
#
# Here we just gather the information and add them to the global associative array oh_my_git_info.
# Presentation is left to the themes.
#
function +vi-oh-my-git-status {
	typeset -gA oh_my_git_info=();

	# Early return if git repo is configured to be hidden
	[[ "$(git config --get oh-my-git.disabled)" == "true" ]] && return

	# Git info
	local current_commit_hash=$(git rev-parse HEAD 2> /dev/null)
	
	if [[ -n $current_commit_hash ]]; then	# is a git repo
		local        git_dir=$(git rev-parse --git-dir 2>/dev/null)
		local current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
		local       upstream=$(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} 2> /dev/null)
		local number_of_logs=$(git log --pretty=oneline -n1 2> /dev/null | wc -l | tr -d ' ')
		local     git_status=$(git status --porcelain 2> /dev/null)
		
		local        modifications=$(grep -c '^.M' <<< "$git_status")
		local modifications_cached=$(grep -c '^M' <<< "$git_status")
		local            deletions=$(grep -c '^.D' <<< "$git_status")
		local     deletions_cached=$(grep -c '^D' <<< "$git_status")
		local                 adds=$(grep -c '^A' <<< "$git_status")
		local            untracked=$(grep -c '^??' <<< "$git_status")
		local            conflicts=$(grep -c '^U' <<< "$git_status")

		local unstaged=$(( modifications + deletions + untracked ))
		local   staged=$(( adds + modifications_cached + deletions_cached ))

		if [[ $current_branch == 'HEAD' ]]; then local detached=true; else local detached=false; fi
		if [[ -n "${upstream}" && "${upstream}" != "@{upstream}" ]]; then local has_upstream=true; else local has_upstream=false; fi
		if [[ $staged -gt 0 && $unstaged -eq 0 ]]; then local ready_to_commit=true; else local ready_to_commit=false; fi
	
		if [[ $number_of_logs -eq 0 ]]; then
			local just_init=true
		else
			local tag_at_current_commit=$(git describe --exact-match --tags $current_commit_hash 2> /dev/null)
			local           will_rebase=$(git config --get branch.${current_branch}.rebase 2> /dev/null)

			local has_diverged=false
			local can_fast_forward=false
			local stashes=0

			if [[ $has_upstream == true ]]; then
				local commits_diff=$(git log --pretty=oneline --topo-order --left-right ${current_commit_hash}...${upstream} 2> /dev/null)
				local       action=$(git_current_action $git_dir)

				local commits_ahead=$(grep -c "^<" <<< "$commits_diff");
				local commits_behind=$(grep -c "^>" <<< "$commits_diff");

				if [[ $commits_ahead -gt 0 && $commits_behind -gt 0 ]] && has_diverged=true
				if [[ $commits_ahead -eq 0 && $commits_behind -gt 0 ]] && can_fast_forward=true
			fi

			if [[ -f ${git_dir}/refs/stash ]]; then
				stashes=$(wc -l 2> /dev/null < ${git_dir}/refs/stash | tr -d ' ')
			fi
		fi

		oh_my_git_info=(
			branch					"${current_branch}"
			upstream				"${upstream//\/$current_branch/}"
			tag						"${tag_at_current_commit}"
			hash					"${current_commit_hash:0:7}"

			stashes					"${stashes}"
			untracked				"${untracked}"
			adds					"${adds}"
			deletions				"${deletions}"
			deletions_cached		"${deletions_cached}"
			modifications			"${modifications}"
			modifications_cached	"${modifications_cached}"
			staged					"${staged}"
			unstaged				"${unstaged}"
			conflicts				"${conflicts}"
			behind					"${commits_behind}"
			ahead					"${commits_ahead}"

			is_detached				"${detached}"
			ready_to_commit			"${ready_to_commit}"
			has_upstream			"${has_upstream}"
			has_diverged			"${has_diverged}"
			can_fast_forward		"${can_fast_forward}"
			will_rebase				"${will_rebase}"
		);
	fi
}

# based on bash __git_ps1 to read branch and current action
function git_current_action () {
	local info=${1:-$(git rev-parse --git-dir 2>/dev/null)}
	local action

	if [ -n "$info" ]; then
		if [ -f "$info/rebase-merge/interactive" ]; then
			action=${is_rebasing_interactively:-"REBASE-i"}
		elif [ -d "$info/rebase-merge" ]; then
			action=${is_rebasing_merge:-"REBASE-m"}
		elif [ -d "$info/rebase-apply" ]; then
			if [ -f "$info/rebase-apply/rebasing" ]; then
				action=${is_rebasing:-"REBASE"}
			elif [ -f "$info/rebase-apply/applying" ]; then
				action=${is_applying_mailbox_patches:-"|AM"}
			else
				action=${is_rebasing_mailbox_patches:-"AM/REBASE"}
			fi
		elif [ -f "$info/MERGE_HEAD" ]; then
			action=${is_merging:-"MERGING"}
		elif [ -f "$info/CHERRY_PICK_HEAD" ]; then
			action=${is_cherry_picking:-"CHERRY-PICKING"}
		elif [ -f "$info/BISECT_LOG" ]; then
			action=${is_bisecting:-"BISECTING"}
		fi  
	fi

	echo -n $action
}

# register vcs hook to gather the git information
zstyle ':vcs_info:git*+post-backend:prompt:*' hooks oh-my-git-status
