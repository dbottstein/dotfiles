function ls --description 'List contents of directory'
    # BSD, macOS and others support colors with ls -G.
    # GNU ls and FreeBSD ls takes --color=auto. Order of this test is important because ls also takes -G but it has a different meaning.
    # Solaris 11's ls command takes a --color flag.
    # OpenBSD requires the separate colorls program for color support.
    # Also test -F because we'll want to define this function even with an ls that can't do colors (like NetBSD).
    if not set -q __fish_ls_color_opt
        set -g __fish_ls_color_opt
        set -g __fish_ls_command ls
        # OpenBSD ships a command called "colorls" that takes "-G" and "-F",
        # but there's also a ruby implementation that doesn't understand "-F".
        # Since that one's quite different, don't use it.
        if command -sq colorls
            and command colorls -GF >/dev/null 2>/dev/null
            set -g __fish_ls_color_opt -GF
            set -g __fish_ls_command colorls
        else
            for opt in --color=auto -G --color -F
                if command ls $opt / >/dev/null 2>/dev/null
                    set -g __fish_ls_color_opt $opt
                    break
                end
            end
        end
    end

    isatty stdout; and set -a opt -FH

    command $__fish_ls_command $__fish_ls_color_opt $opt $argv
end