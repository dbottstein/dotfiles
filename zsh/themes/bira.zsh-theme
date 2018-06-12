function toon {
  echo -n ""
}

function +vi-git-status() {
	local format1 format2 format3 stats
	local __GIT_PROMPT_DIR="${0:A:h}"

    stats=$( $__GIT_PROMPT_DIR/gitstatus.py )
	stats=( "${(@s: :)stats}" )

    format1="%F{81}%b"
    format2="|"
  	format3="|%F{118}%a%f"

    if [ "$stats[3]" -ne "0" ]; then
    	format1="$format1%{↓%G%}$stats[3]"		# commits behind
    fi
    if [ "$stats[2]" -ne "0" ]; then
    	format1="$format1%{↑%G%}$stats[2]"		# commits ahead
    fi
    
    format1+="%f"

    if [ "$stats[4]" -ne "0" ]; then
    	format2+="%F{118}%{●%G%}$stats[4]%f"			# staged
    fi
    if [ "$stats[5]" -ne "0" ]; then
    	format2+="%{$fg[red]%}%{✖%G%}$stats[5]%f"	# conflicts
    fi
    if [ "$stats[6]" -ne "0" ]; then
    	format2+="%F{135}%{+%G%}$stats[6]%f"		# changed
    fi
    if [ "$stats[7]" -ne "0" ]; then
    	format2+="%{…%G%}$stats[7]%f"				# untracked
    fi
    if [[ "$format2" == "|" ]]; then
    	format2+="%{$fg_bold[green]%}%{✔%G%}%f"		# clean
    fi

#  zstyle ':vcs_info:*:prompt:*' unstagedstr "${unstaged_format}"
#  zstyle ':vcs_info:*:prompt:*' stagedstr "${staged_format}"
	zstyle ':vcs_info:*:prompt:*' formats "${format1}" "${format2}"
	zstyle ':vcs_info:*:prompt:*' actionformats "${format1}" "${format2}" "${action_format}"
}

function prompt_bira_precmd() {
  vcs_info 'prompt'
}

function prompt_bira_setup() {
  autoload -Uz add-zsh-hook vcs_info

	local return_code='%(?..%F{red}%? ↵%f)'
	local user_host='%F{118}%n@%m%f'
	local current_dir='%B%F{blue} %~%f%b'

  # Add hook for calling vcs_info before each command.
  add-zsh-hook precmd prompt_bira_precmd

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*:prompt:*' check-for-changes true
  zstyle ':vcs_info:*:prompt:*' nvcsformats   "" "" ""
  zstyle ':vcs_info:git+post-backend:prompt:*' hooks git-status

	PROMPT="╭─${user_host} ${current_dir} (${vcs_info_msg_0_}${vcs_info_msg_1_}${vcs_info_msg_2_})
╰─ %B$(toon)%b "
	RPS1="${return_code}"
}

prompt_bira_setup "$@"
