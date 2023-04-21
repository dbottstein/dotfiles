function e64 -a text --wraps base64 --description "Encode text to base64"
    if test -z "$text"
        cat | base64
    else
        printf '%s' ""$text" | base64
    fi
end