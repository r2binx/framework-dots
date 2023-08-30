
function fish-config -a cmd -d 'Handy alias to manage a fish config'
	# set config_home '~/.config/fish'
	set config_home $__fish_config_dir

	switch $cmd
		case edit
			eval $EDITOR $config_home/config.fish
		case reload
			eval source $config_home/config.fish
		case functions
			if test (count $argv) -gt 1
				eval $EDITOR $config_home/functions/$argv[2..]
			else
				eval $EDITOR $config_home/functions
			end
		case home '*'
			eval $EDITOR $config_home
	end
end
