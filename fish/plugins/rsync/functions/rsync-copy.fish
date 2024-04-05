function rsync-copy --wraps rsync -d "Remote copy files"
    argparse 'a' -- $argv
    set -l opt
    if not set -q _flag_a
        set -q rsync_exclude_file
            and set -a opt "--exclude-from=$rsync_exclude_file"
    end
    rsync -avz --progress -h $opt $argv
end
