BASE_DIR=$(dirname $0)/..

test -f "$ZDOTDIR/.zshenv" || cp $BASE_DIR/zsh/dotfiles/zshenv $ZDOTDIR/.zshenv
test -f "$ZDOTDIR/.zprofile" || cp $BASE_DIR/zsh/dotfiles/zshenv $ZDOTDIR/.zprofile
test -f "$ZDOTDIR/.zlogin" || cp $BASE_DIR/zsh/dotfiles/zshenv $ZDOTDIR/.zlogin
test -f "$ZDOTDIR/.zshrc" || cp $BASE_DIR/zsh/dotfiles/zshenv $ZDOTDIR/.zshrc
test -f "$ZDOTDIR/.zplugrc" || cp $BASE_DIR/zsh/dotfiles/zplugrc $ZDOTDIR/.zplugrc
