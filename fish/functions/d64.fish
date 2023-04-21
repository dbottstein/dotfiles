function d64 -a text --wraps base64 --description "Decode text from base64"
    if test -z "$text"
        cat | base64 --decode
    else
        printf '%s' "$text" | base64 --decode
    fi
end