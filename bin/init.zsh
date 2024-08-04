mkdir -pv ${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump
mkdir -pv ${XDG_STATE_HOME:-$HOME/.local/state}/zsh

[ -f ~/.zshenv -a ! -L .zshenv ] && mv -nv ~/.zshenv ~/.zshenv_orig
[ -L ~/.zshenv ] || ln -sv ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/dot/zshenv ~/.zshenv
[ -f ~/.zhistory ] && mv -nv ~/.zhistory ${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history
