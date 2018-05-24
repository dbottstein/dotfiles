# host autocompletion for hosts from known_hosts
###zstyle -e ':completion::*:hosts' hosts 'reply=(
###	${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
###      /dev/null)"}%%[# ]*}//,/ }
###    ${${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < \
###      ~/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*}
###	)'

# ignore files already given for rm, kill, diff
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

###zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# autocomplete man pages
setopt SH_WORD_SPLIT
function man_var () {
    man_pages=( /usr/share/man*/**/*(N:t:r:r) )
    compctl -k man_pages man
    reply=( $man_pages )
}
compctl -K man_var man; man_pages=()

# Completes all manner of files given prefixes for each path segment.
# # e.g. s/z/s -> src/zsh-2.4/src
compctl -D -f + -U -K multicomp

# random file extensions
compctl -g '*.pdf' + -g '*.ps.*' evince
compctl -g '*(-/) .*(-/)' cd
compctl -g '*.c' + -g '*.cpp' + -g '*.cc' gcc
compctl -g '*.src.rpm' koji

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %B%F{yellow}%d%f%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order 'local-directories named-directories path-directories'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:warnings' format $' \e[30;41m No Match Found \e[0m\e[31m\e[0m'
