set -gx LSCOLORS ExGxBxDxCxEgEdxbxgxcxd
set -gx CLICOLOR 1

if ! set -qx LS_COLORS && set -l cmd (command -s {g,}dircolors)[1]
    set -l colorfile
    for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
        if test -f $file
            set colorfile $file
            break
        end
    end
    fenv eval "$cmd -b $colorfile"
end
