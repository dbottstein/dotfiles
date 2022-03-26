#!/bin/bash
BASE_DIR=$(cd $(dirname $0)/..; pwd -P)

test -d ${XDG_CONFIG_HOME:-$HOME/.config} || mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}
test -d ${XDG_CACHE_HOME:-$HOME/.cache} || mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}
test -d ${XDG_DATA_HOME:-$HOME/.local/share} || mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}
test -d ${XDG_STATE_HOME:-$HOME/.local/state} || mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}

test -L ${XDG_CONFIG_HOME:-$HOME/.config}/zsh || ln -sv $BASE_DIR/zsh $CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/fish || ln -sv $BASE_DIR/fish $CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/git || ln -sv $BASE_DIR/git $CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/vim || ln -sv $BASE_DIR/vim $CONFIG_HOME/

[ -n "$(which bash)" ] && bash -c "$BASH_DIR/bash/install.sh"
[ -n "$(which zsh)"  ] && zsh -c "$BASH_DIR/zsh/install.zsh"
[ -n "$(which fish)" ] && fish -c "$BASH_DIR/fish/install.fish"
