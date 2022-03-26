
umask 002

autoload -U zsh-mime-setup
zsh-mime-setup

typeset -U plugins_prezto plugins_omz plugins_github plugins_local

if [ -e "$zdotdir/init.zsh.${system:l}" ]; then
    source $zdotdir/init.zsh.${system:l}
fi

# \033[38;2;<r>;<g>;<b>m     #Select RGB foreground color
# \033[48;2;<r>;<g>;<b>m     #Select RGB background color
# echo "\033[38;2;255;82;197;48;2;155;106;0m"
# background=$'\e[48;2;0;85;85m'

zstyle ':prezto:module:prompt:qoup'            colors prompt yellow user 244
zstyle ':prezto:module:prompt:oppa-lana-style' colors prompt_foreground yellow user_foreground 244
#zstyle ':prezto:module:prompt:*' symbols return ""
#zstyle ':vcs_info:*:prompt:bira:*' colors prompt yellow user 244

zstyle -t ':prezto:module:prompt:*' symbols prompt || zstyle ':prezto:module:prompt:*' symbols prompt "⦿"

source $zdotdir/.zplugrc

#zstyle ‘:completion:*’ verbose yes
#zstyle ‘:completion:*:descriptions’ format ‘%B%d%b’
#zstyle ‘:completion:*:messages’ format ‘%d’
#zstyle ‘:completion:*:warnings’ format ‘No matches for: %d’
#zstyle ‘:completion:*’ group-name ”
