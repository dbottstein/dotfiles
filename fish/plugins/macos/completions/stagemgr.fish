set -l _commands "on off bounce toggle status"
complete -f -c stagemgr
complete -c stagemgr -n "not __fish_seen_subcommand_from $_commands" -a on -d 'enable'
complete -c stagemgr -n "not __fish_seen_subcommand_from $_commands" -a off -d 'disable'
complete -c stagemgr -n "not __fish_seen_subcommand_from $_commands" -a bounce -d 'disable, then enable'
complete -c stagemgr -n "not __fish_seen_subcommand_from $_commands" -a toggle -d 'toggle current state'
complete -c stagemgr -n "not __fish_seen_subcommand_from $_commands" -a status -d 'show current state'
