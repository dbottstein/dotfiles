function __bd_uninstall --on-event bd_uninstall
    bind -e .
    functions -e __bd_expand-dot-to-parent-directory-path __bd_uninstall
end

function __bd_expand-dot-to-parent-directory-path
    set -l token (commandline -t)
    if string match -qr '(^|\/)(\.\.)$' -- "$token"
        commandline -i '/..'
    else
        commandline -i '.'
    end
    commandline -f repaint
end

bind . __bd_expand-dot-to-parent-directory-path
