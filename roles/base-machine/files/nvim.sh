#!/bin/bash

nvim_dir='/home/elian/.config/nvim'

if [ -d $nvim_dir ]; then

	read -p "~/.config/nvim found, continue? This will delete your configuration. (y/n) > " -n 1 -r

	echo

	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
	fi

	echo "deleting..."
	sudo rm -r /home/elian/.config/nvim/
	echo "cloning repository..."
	git clone https://github.com/elianmanzueta/nvim.git /home/elian/.config/nvim
else
	echo "nvim directory not found, installing configuration..."
	git clone https://github.com/elianmanzueta/nvim.git /home/elian/.config/nvim
fi
