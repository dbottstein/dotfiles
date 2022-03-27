if test "$ITERM_PROGRAM" = "iTerm.app"
    set --local plugin_dir (status dirname)

    test -f "$plugin_dir/../iterm2_shell_integration.fish"
        and source "$plugin_dir/../iterm2_shell_integration.fish"
end
