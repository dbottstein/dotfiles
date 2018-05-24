function toon {
  echo -n ""
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
#local current_dir='%{$terminfo[bold]$fg[magenta]%} %~%{$reset_color%}'
local current_dir='%{$FX[bold]$FG[196]%} %~%{$reset_color%}'
local git_status='$(git_super_status)'
local rvm_ruby=''

if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_status}
╰─ %B$(toon)%b "
RPS1="${return_code}"
