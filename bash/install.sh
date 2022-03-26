BASE_DIR=$(cd $(dirname $0); pwd -P)

mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/bash

test -f ~/.bash_profile && mv ~/.bash_profile ~/.bash_profile_orig
test -f ~/.bashrc && mv ~/.bashrc ~/.bashrc_orig

test -L ~/.bash_profile || ln -sv $BASE_DIR/dot/bash_profile ~/.bash_profile
test -L ~/.bashrc || ln -sv $BASE_DIR/dot/bashrrc ~/.bashrc
