plugin_dir = $(dirname $0)

test -f "$plugin_dir/iterm2_shell_integration.zsh" \
    && source "$plugin_dir/iterm2_shell_integration.zsh"
