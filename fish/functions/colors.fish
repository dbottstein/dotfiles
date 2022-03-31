function colors -d "Show 256 TERM colors"
    for c in (seq 0 15)
        printf '\e[38;5;%dm%03d\e[38;5;240m\u2502' $c $c
    end
    printf '\e[0m\n'

    for i in (seq 0 5)
        for c in (seq (math "($i * 36) + 16") (math "($i * 36) + 51"))
            printf '\e[38;5;%dm%03d\e[38;5;240m\u2502' $c $c
        end
        printf '\e[0m\n'
    end

    for c in (seq 232 255)
        printf '\e[38;5;%dm%03d\e[38;5;240m\u2502' $c $c
    end
    printf '\e[0m\n'
end
