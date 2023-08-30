
complete -f -c fish-config -n __fish_use_subcommand -a edit -d 'Edit config.fish'
complete -f -c fish-config -n __fish_use_subcommand -a reload -d 'Reload fish configuration'
complete -f -c fish-config -n __fish_use_subcommand -a functions -d 'Open fish functions dir'
complete -f -c fish-config -n '__fish_seen_subcommand_from functions'  -a "(ls $__fish_config_dir/functions)"
complete -f -c fish-config -n __fish_use_subcommand -a home -d 'Open fish config dir'
