HELPDIR=/usr/share/zsh/$ZSH_VERSION/help

(( ${+aliases[run-help]} )) && unalias run-help

autoload run-help
autoload run-help-git
autoload run-help-ip
autoload run-help-openssl
autoload run-help-p4
autoload run-help-sudo
