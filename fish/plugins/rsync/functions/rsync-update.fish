function rsync-update --wraps rsync -d "Remote update files"
    set -l opt
    set -q rsync_exclude_file
        and set -a opt "--exclude-from=$rsync_exclude_file"
    rsync -avzu --progress -h $opt $argv
end