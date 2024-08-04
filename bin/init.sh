#!/bin/bash
script_path=$(cd $(dirname $0); pwd -P)
base_path=$(cd $(dirname $0)/..; pwd -P)

test -d ${XDG_CONFIG_HOME:-$HOME/.config} || mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}
test -d ${XDG_CACHE_HOME:-$HOME/.cache} || mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}
test -d ${XDG_DATA_HOME:-$HOME/.local/share} || mkdir -p ${XDG_DATA_HOME:-$HOME/.local/share}
test -d ${XDG_STATE_HOME:-$HOME/.local/state} || mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}

test -d ${XDG_CONFIG_HOME:-$HOME/.config}/bash && mv ${XDG_CONFIG_HOME:-$HOME/.config}/bash ${XDG_CONFIG_HOME:-$HOME/.config}/bash_orig
test -d ${XDG_CONFIG_HOME:-$HOME/.config}/zsh  && mv ${XDG_CONFIG_HOME:-$HOME/.config}/zsh  ${XDG_CONFIG_HOME:-$HOME/.config}/zsh_orig
test -d ${XDG_CONFIG_HOME:-$HOME/.config}/fish && mv ${XDG_CONFIG_HOME:-$HOME/.config}/fish ${XDG_CONFIG_HOME:-$HOME/.config}/fish_orig
test -d ${XDG_CONFIG_HOME:-$HOME/.config}/git  && mv ${XDG_CONFIG_HOME:-$HOME/.config}/git ${XDG_CONFIG_HOME:-$HOME/.config}/git_orig
test -d ${XDG_CONFIG_HOME:-$HOME/.config}/vim  && mv ${XDG_CONFIG_HOME:-$HOME/.config}/vim ${XDG_CONFIG_HOME:-$HOME/.config}/vim_orig

test -L ${XDG_CONFIG_HOME:-$HOME/.config}/bash || ln -sv $base_path/bash ${XDG_CONFIG_HOME:-$HOME/.config}/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/zsh  || ln -sv $base_path/zsh ${XDG_CONFIG_HOME:-$HOME/.config}/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/fish || ln -sv $base_path/fish ${XDG_CONFIG_HOME:-$HOME/.config}/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/git  || ln -sv $base_path/git ${XDG_CONFIG_HOME:-$HOME/.config}/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/vim  || ln -sv $base_path/vim ${XDG_CONFIG_HOME:-$HOME/.config}/
test -L ${XDG_CONFIG_HOME:-$HOME/.config}/nvim  || ln -sv $base_path/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/

mkdir -p ~/.local/bin ~/.local/lib

command -v bash >/dev/null && bash -c "source $script_path/init.bash"
command -v zsh >/dev/null  && zsh -c "source $script_path/init.zsh"
command -v fish >/dev/null && fish -c "source $script_path/init.fish"
command -v vim >/dev/null  && vim -E -c PlugInstall -c 'qa!'
