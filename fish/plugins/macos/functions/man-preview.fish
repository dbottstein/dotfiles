function "man-preview" --wraps man -d "Open man page in Preview"
    man -w $argv
    and man -t $argv | open -f -a Preview
    or man $argv
end