# Plugin for highlighting file content
# Plugin highlights file content based on the filename extension.
# If no highlighting method supported for given extension then it tries 
# guess it by looking for file content.

alias colorize='colorize_via_pygmentize'

colorize_via_pygmentize() {
    local opts=(-O style=native,encoding=utf-8 -f terminal256)

    if [ ! -x "$commands[pygmentize]" ]; then
        echo "package \'pygmentize\' is not installed!"
        return -1
    fi

    if [ $# -eq 0 ]; then
        pygmentize $opts -g $@
    fi

    for FNAME in $@
    do
        filename=$(basename "$FNAME")
        lexer=`pygmentize -N \"$filename\"`

        if [ $lexer == text ]; then
            case $filename in
                *.zsh*)
                     lexer=sh
                     ;;
            esac
        fi

        if [ $lexer == text ]; then
            pygmentize $opts -g -- "$FNAME"
        else
            pygmentize $opts -l $lexer -- "$FNAME"
        fi
    done
}
