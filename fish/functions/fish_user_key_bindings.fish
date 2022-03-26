function fish_user_key_bindings
    function __expand-dot-to-parent-directory-path
        set -l token (commandline -t)
        if string match -qr '(^|\/)(\.\.)$' -- "$token"
            commandline -i '/..'
        else
            commandline -i '.'
        end
        commandline -f repaint
    end

    bind . __expand-dot-to-parent-directory-path
end
