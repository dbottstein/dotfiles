#!/bin/zsh
BASE_DIR=$(dirname $0)/..

zdotdir=${ZDOTDIR:-$HOME}

test -f "$zdotdir/.zshenv" || cp -v $BASE_DIR/zsh/dot/zshenv $zdotdir/.zshenv
test -f "$zdotdir/.zprofile" || cp -v $BASE_DIR/zsh/dot/zprofile $zdotdir/.zprofile
test -f "$zdotdir/.zlogin" || cp -v $BASE_DIR/zsh/dot/zshenv $zdotdir/.zlogin
test -f "$zdotdir/.zshrc" || cp -v $BASE_DIR/zsh/dot/zshenv $zdotdir/.zshrc
test -f "$zdotdir/.zplugrc" || cp -v $BASE_DIR/zsh/dot/zplugrc $zdotdir/.zplugrc

test -f "$zdotdir/.bash_profile" || cp -v $BASE_DIR/bash/dot/bash_profile $zdotdir/.bash_profile
test -f "$zdotdir/.bashrc" || cp -v $BASE_DIR/bash/dot/bashrc $zdotdir/.bashrc
