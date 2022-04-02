function bd --argument-names dir --description "traverse parent directories"
    if test (count $argv) = 0
        cd ../
        return 0
    end
    
    if string match --quiet --regex -- '\d+' "$dir"
        cd (string repeat -n $dir "../")
        return 0
    end

    set -l nodes (string split '/' $PWD)[-2..2] "/"
    
    for x in (seq 1 (count $nodes))
        if test "$dir" = "$nodes[$x]"
            cd (string repeat -n $x "../")
            return 0
        end
    end

    echo (status current-command): "no parent directory named $dir"
    return 1
end
