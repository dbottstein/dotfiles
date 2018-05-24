BASE_DIR=$(dirname $0)/..

test -f "$HOME/.zshenv" || cp $BASE_DIR/zsh/dotfiles/zshenv $HOME/.zshenv
test -f "$HOME/.zprofile" || cp $BASE_DIR/zsh/dotfiles/zshenv $HOME/.zprofile
test -f "$HOME/.zlogin" || cp $BASE_DIR/zsh/dotfiles/zshenv $HOME/.zlogin
test -f "$HOME/.zshrc" || cp $BASE_DIR/zsh/dotfiles/zshenv $HOME/.zshrc
