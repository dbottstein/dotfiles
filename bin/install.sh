#!/bin/zsh
BASE_DIR=$(dirname $0)/..

zdotdir=${ZDOTDIR:-$HOME}

test -f "$zdotdir/.zshenv" || cp -v $BASE_DIR/zsh/dotfiles/zshenv $zdotdir/.zshenv
test -f "$zdotdir/.zprofile" || cp -v $BASE_DIR/zsh/dotfiles/zshenv $zdotdir/.zprofile
test -f "$zdotdir/.zlogin" || cp -v $BASE_DIR/zsh/dotfiles/zshenv $zdotdir/.zlogin
test -f "$zdotdir/.zshrc" || cp -v $BASE_DIR/zsh/dotfiles/zshenv $zdotdir/.zshrc
test -f "$zdotdir/.zplugrc" || cp -v $BASE_DIR/zsh/dotfiles/zplugrc $zdotdir/.zplugrc
