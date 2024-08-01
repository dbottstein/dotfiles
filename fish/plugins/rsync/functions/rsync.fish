function rsync -a command --wraps rsync -d "Synchronize files"
    argparse 'a/all' -- $args
    set -l opt
    
    if not set -q _flag_all
        set -q rsync_exclude_file
            and set -a opt "--exclude-from=$rsync_exclude_file"
    end
    
    switch $command
        case copy
            command rsync -avzh --progress $opt $argv
        case move
            command rsync -avzh --progress --remove-source-files $opt $argv
        case update
            command rsync -avzuh --progress $opt $argv
        case sync
            command rsync -avzuh --delete --progress $opt $argv
        case '*'
            command rsync $argv
    end
end