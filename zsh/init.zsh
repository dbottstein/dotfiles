
umask 002

autoload -U zsh-mime-setup
zsh-mime-setup

if [ -z "$prompt_symbol" ]; then
    case "$OSTYPE" in
        darwin*) prompt_symbol="" ;;
        cygwin*) prompt_symbol="" ;;
        linux*) prompt_symbol="" ;;
        *) prompt_symbol="⦿" ;;
    esac
fi

#echo -e "\033]6;1;bg;red;brightness;18\a"
#echo -e "\033]6;1;bg;green;brightness;26\a"
#echo -e "\033]6;1;bg;blue;brightness;33\a"

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:prompt:*:bira' colors prompt yellow user 244
#zstyle ':vcs_info:*:prompt:*:*' symbols return ""

zstyle -t ':vcs_info:*:prompt:*:*' symbols prompt || zstyle ':vcs_info:*:prompt:*:*' symbols prompt "$prompt_symbol"

zstyle ':vcs_info:*:prompt:*:oppa_lana_style' formats \
            "%F{244}%K{239} %n@%m %F{239}%K{57}%F{white} %~ %F{57}%k"$'\n'" %F{yellow}%k${prompt_symbol} %f%k%b" \
            "%F{244}%K{239} %n@%m %F{239}%K{57}%F{white} %25<...<%~%<< %F{57}%K{white}" \
            $'\n'" %F{yellow}%k${prompt_symbol} %f%k%b" \
            "%(?..%F{$red}%? ↵%f)"

source $zdotdir/.dotfiles/zsh/dot/zplugrc.prezto

zstyle ‘:completion:*’ verbose yes
zstyle ‘:completion:*:descriptions’ format ‘%B%d%b’
zstyle ‘:completion:*:messages’ format ‘%d’
zstyle ‘:completion:*:warnings’ format ‘No matches for: %d’
zstyle ‘:completion:*’ group-name ”

unset prompt_symbol
