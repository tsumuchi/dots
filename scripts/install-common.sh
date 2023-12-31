#!/bin/bash

main() {
	check_vars
	link_config
	# link_share # This would need some dotfiles to go in ~/.local/share to be useful
}

function check_vars {
	shouldexit=false
	if [[ -z "$XDG_CONFIG_HOME" ]]; then
		echo "\$XDG_CONFIG_HOME is not set. Please make sure this is set in your shell."
		shouldexit=true
	fi
	
	if [[ -z "$XDG_DATA_HOME" ]]; then
		echo "\$XDG_DATA_HOME is not set. Please make sure this is set in your shell."
		shouldexit=true
	fi

	if [ $shouldexit = true ]; then
		exit 1
	fi
}

function link_config {
	cd "$(dirname "$0")/../common/config/"

	for i in *
	do
		echo "Creating symlink for $PWD/$i in $XDG_CONFIG_HOME/"
		ln -sf $PWD/$i $XDG_CONFIG_HOME/
	done
}

function link_share {
	cd "$(dirname "$0")/../common/share/"

	for i in *
	do
		echo "Creating symlink for $PWD/$i in $XDG_DATA_HOME/"
		ln -sf $PWD/$i $XDG_DATA_HOME/
	done
}

main "$@"
