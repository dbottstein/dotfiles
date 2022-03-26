function fish_greeting -d "What's up, fish?"
    set_color $fish_color_autosuggestion
    uname -nmsr

    set_color normal

    if status is-interactive
        echo
        fortune -a
    end
end
