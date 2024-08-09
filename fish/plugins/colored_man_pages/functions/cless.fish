function cless -d "Configure less to colorize styled text using environment variables before executing a command that will use less"
    set -q colored_man_blink; and set -l blink (set_color -o $colored_man_blink); or set -l blink (set_color -o red)
    set -q colored_man_bold; and set -l bold (set_color -o $colored_man_bold); or set -l bold (set_color -o 0280A5)  # 5fafd7
    set -q colored_man_standout; and set -l standout (set_color -r $colored_man_standout); or set -l standout (set_color -r F0CB02) # 949494
    set -q colored_man_underline; and set -l underline (set_color -u $colored_man_underline); or set -l underline (set_color -u 5BA502) # afafd7

    set -l end (set_color normal)

    set -lx LESS_TERMCAP_mb $blink
    set -lx LESS_TERMCAP_md $bold
    set -lx LESS_TERMCAP_me $end
    set -lx LESS_TERMCAP_so $standout
    set -lx LESS_TERMCAP_se $end
    set -lx LESS_TERMCAP_us $underline
    set -lx LESS_TERMCAP_ue $end
    set -lx LESS '-R -s'

    $argv
end
