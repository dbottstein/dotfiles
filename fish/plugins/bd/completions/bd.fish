set -l nodes (string split '/' $PWD)[-2..2] "/"
set -l args

for x in (seq 1 (count $nodes))
    set -a args "$x\t$nodes[$x]\n"
end

complete -c bd --keep-order --no-files -a "$args"
