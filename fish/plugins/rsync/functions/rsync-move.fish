function rsync-move --wraps rsync -d "Remote move files"
    set -l opt
    set -q rsync_exclude_file
        and set -a opt "--exclude-from=$rsync_exclude_file"
    rsync -avz --progress -h --remove-source-files $opt $argv
end