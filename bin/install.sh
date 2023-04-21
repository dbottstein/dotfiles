#!/bin/bash
script_path=$(cd $(dirname $0); pwd -P)
base_path=$(cd $(dirname $0)/..; pwd -P)

test -d ${XDG_CONFIG_HOME:-$HOME/.config} || mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}
test -d ${XDG_CACHE_HOME:-$HOME/.cache} || mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}
test -d ${XDG_DATA_HOME:-$HOME/.local/share} || mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}
test -d ${XDG_STATE_HOME:-$HOME/.local/state} || mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}

test -L ${XDG_CONFIG_HOME:-$HOME/.config}/bash || ln -sv $base_path/bash $XDG_CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/zsh || ln -sv $base_path/zsh $XDG_CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/fish || ln -sv $base_path/fish $XDG_CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/git || ln -sv $base_path/git $XDG_CONFIG_HOME/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/vim || ln -sv $base_path/vim $XDG_CONFIG_HOME/

mkdir -p ~/.local/bin ~/.local/lib

[ -n "$(which bash)" ] && bash -c "source $script_path/install.bash"
[ -n "$(which zsh)"  ] && zsh -c "source $script_path/install.zsh"
[ -n "$(which fish)" ] && fish -c "source $script_path/install.fish"
