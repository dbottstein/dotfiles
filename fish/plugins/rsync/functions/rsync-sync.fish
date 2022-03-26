function rsync-sync --wraps rsync -d "Remote synchronize files"
    set -l opt
    set -q rsync_exclude_file
        and set -a opt "--exclude-from=$rsync_exclude_file"
    rsync -avzu --delete --progress -h $opt $argv
end