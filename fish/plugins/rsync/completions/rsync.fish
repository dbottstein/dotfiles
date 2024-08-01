set -l rsync_commands "copy move update sync"
complete -c rsync -n "not __fish_seen_subcommand_from $rsync_commands" -a update -d 'update tree (no deletes)'
complete -c rsync -n "not __fish_seen_subcommand_from $rsync_commands" -a sync -d 'sync tree'
complete -c rsync -n "not __fish_seen_subcommand_from $rsync_commands" -a move -d 'move tree'
complete -c rsync -n "not __fish_seen_subcommand_from $rsync_commands" -a copy -d 'copy tree'

# options
complete -c rsync -s a -l all -d 'sync all files (ignore file excludes)'

#                                                                                                                                                             
# Hostname completion                                                                                                                                         
#                                                                                                                                                             
complete -c rsync -d Hostname -a "                                                                                                                            
(__fish_print_hostnames):                                                                                                                                     
                                                                                                                                                              
(                                                                                                                                                             
    # Prepend any username specified in the completion to the hostname.                                                                                       
    commandline -ct |sed -ne 's/\(.*@\).*/\1/p'                                                                                                               
)(__fish_print_hostnames):                                                                                                                                    
                                                                                                                                                              
(__fish_print_users)@\tUsername                                                                                                                               
"                                                                                                                                                             
                                                                                                                                                              
#                                                                                                                                                             
# Remote path                                                                                                                                                 
#                                                                                                                                                             
complete -c rsync -d "Remote path" -n "commandline -ct | string match -q '*:*'" -xa "                                                                         
(                                                                                                                                                             
    # Prepend any user@host:/path information supplied before the remote completion.                                                                          
        __rsync_remote_target                                                                                                                                 
)(                                                                                                                                                            
    # Get the list of remote files from the specified rsync server.                                                                                           
        rsync --list-only (__rsync_remote_target) 2>/dev/null | string replace -r '^d.*' '\$0/' |                                                             
        string replace -r '(\S+\s+){4}' '' | # drop the first four columns                                                                                    
        string escape -n                                                                                                                                      
)                                                                                                                                                             
"
