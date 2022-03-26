set -q XDG_CONFIG_HOME; or set --universal --export XDG_CONFIG_HOME -$HOME/.config
set -q XDG_DATA_HOME;   or set --universal --export XDG_DATA_HOME -$HOME/.local/share
set -q XDG_STATE_HOME;  or set --universal --export XDG_STATE_HOME -$HOME/.local/state
set -q XDG_CACHE_HOME;  or set --universal --export XDG_CACHE_HOME -$HOME/.cache
set -q XDG_DATA_DIRS;   or set --universal --export --path XDG_DATA_DIRS /usr/local/share /usr/share
set -q XDG_DATA_DIRS;   or set --universal --export --path XDG_CONFIG_DIRS /etc/xdg

fish_add_path ~/bin /usr/local/bin
