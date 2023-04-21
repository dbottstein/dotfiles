mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/bash

test -f ~/.bash_profile && mv -nv ~/.bash_profile ~/.bash_profile_orig
test -f ~/.bashrc && mv -nv ~/.bashrc ~/.bashrc_orig

test -L ~/.bash_profile || ln -sv ${XDG_CONFIG_HOME:-$HOME/.config}/bash/dot/bash_profile ~/.bash_profile
test -L ~/.bashrc || ln -sv ${XDG_CONFIG_HOME:-$HOME/.config}/bash/dot/bashrc ~/.bashrc
