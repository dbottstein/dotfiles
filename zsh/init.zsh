
umask 002

autoload -U zsh-mime-setup
zsh-mime-setup

if [ -z "$prompt_symbol" ]; then
    case "$OSTYPE" in
        darwin*) prompt_symbol="" ;;   # 
        cygwin*) prompt_symbol="" ;;
        linux*) prompt_symbol="" ;;
        *) prompt_symbol="⦿" ;;
    esac
fi

# \033[38;2;<r>;<g>;<b>m     #Select RGB foreground color
# \033[48;2;<r>;<g>;<b>m     #Select RGB background color
# echo "\033[38;2;255;82;197;48;2;155;106;0m"
# background=$'\e[48;2;0;85;85m'

zstyle ':prezto:module:prompt:qoup'            colors prompt yellow user 244
zstyle ':prezto:module:prompt:oppa-lana-style' colors prompt_foreground yellow user_foreground 244
#zstyle ':prezto:module:prompt:*' symbols return ""

zstyle -t ':prezto:module:prompt:*' symbols prompt || zstyle ':prezto:module:prompt:*' symbols prompt "${prompt_symbol}"

zstyle ':prezto:module:prompt:oppa-lana-style' 'prompt-formats' \
            'no-git'  "%F{white}%K{blue} %~ %F{blue}%k"
#             suffix "%F{244}%K{239} %n@%m %F{239}%K{57}%F{white} %~ %F{57}%k"$'\n'" %F{yellow}%k${prompt_symbol} %f%k%b" \
#             prefix "%F{244}%K{239} %n@%m %F{239}%K{57}%F{white} %25<...<%~%<< %F{57}%K{white}" \
#             rprompt "%(?..%F{$red}%? ↵%f)" \

source $zdotdir/.dotfiles/zsh/dot/zplugrc.prezto

zstyle ‘:completion:*’ verbose yes
zstyle ‘:completion:*:descriptions’ format ‘%B%d%b’
zstyle ‘:completion:*:messages’ format ‘%d’
zstyle ‘:completion:*:warnings’ format ‘No matches for: %d’
zstyle ‘:completion:*’ group-name ”

unset prompt_symbol
