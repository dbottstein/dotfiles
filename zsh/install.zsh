BASE_DIR=$(cd $(dirname $0); pwd -P)

mkdir -p ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
mkdir -p ${XDG_STATE_HOME:-$HOME/.local/state}/zsh

[ -f ~/.zshenv ] && mv ~/.zshenv ~/.zshenv_orig

mv -nv ~/.zhistory ${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history
cp -nv $BASE_DIR/dot/zshenv ~/.zshenv
