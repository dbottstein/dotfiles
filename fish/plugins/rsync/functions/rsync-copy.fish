function rsync-copy --wraps rsync -d "Remote copy files"
    set -l opt
    set -q rsync_exclude_file
        and set -a opt "--exclude-from=$rsync_exclude_file"
    rsync -avz --progress -h $opt $argv
end