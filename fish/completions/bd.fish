set -l nodes (string split '/' $PWD)[-2..2] "/"
set -l args

for x in (seq 1 (count $nodes))
    if string match '.*' -- $nodes[$x]
        set -a args "$x\t$nodes[$x]\n"
    else
        set -a args "$nodes[$x]\t$x\n"
    end
end

complete -c bd --keep-order --no-files -a "$args"
