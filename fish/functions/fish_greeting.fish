function fish_greeting -d "What's up, fish?"
    set_color $fish_color_comment
    uname -nmsr

    set_color normal

    if status is-interactive
        if command -q fortune
            echo
            fortune -a
        end
    end
end
