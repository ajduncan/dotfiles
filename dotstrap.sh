#!/usr/bin/env bash

cat << EOF
┌────────────────────────────────────────────────────────────────────────────────┐
│                                                                                │
│  oh yes, its my collection of                                                  │
│                                                                                │
│       [0;1;34;94m▄[0;34m▄[0m                         [0;37m▄▄▄▄[0m      [0;1;30;90m██[0m     [0;1;30;90m▄▄▄▄[0m                         │
│       [0;34m██[0m              [0;37m██[0m        [0;1;30;90m██▀▀▀[0m      [0;1;30;90m▀▀[0m     [0;1;34;94m▀▀██[0m                         │
│  [0;34m▄███▄█[0;37m█[0m   [0;37m▄████▄[0m   [0;37m███[0;1;30;90m████[0m   [0;1;30;90m███████[0m    [0;1;34;94m████[0m       [0;1;34;94m██[0m       [0;34m▄████▄[0m   [0;34m▄[0;37m▄█████▄[0m │
│ [0;37m██▀[0m  [0;37m▀██[0m  [0;37m██▀[0m  [0;1;30;90m▀██[0m    [0;1;30;90m██[0m        [0;1;34;94m██[0m         [0;1;34;94m██[0m       [0;34m██[0m      [0;34m██▄[0;37m▄▄▄██[0m  [0;37m██▄▄▄▄[0m [0;37m▀[0m │
│ [0;37m██[0m    [0;37m█[0;1;30;90m█[0m  [0;1;30;90m██[0m    [0;1;30;90m██[0m    [0;1;30;90m█[0;1;34;94m█[0m        [0;1;34;94m██[0m         [0;34m██[0m       [0;34m██[0m      [0;37m██▀▀▀▀▀▀[0m   [0;1;30;90m▀▀▀▀██▄[0m │
│ [0;1;30;90m▀██▄▄███[0m  [0;1;30;90m▀██▄▄[0;1;34;94m██▀[0m    [0;1;34;94m██▄▄▄[0m     [0;34m██[0m      [0;34m▄▄▄██▄▄[0;37m▄[0m    [0;37m██▄▄▄[0m   [0;37m▀██[0;1;30;90m▄▄▄▄█[0m  [0;1;30;90m█▄▄▄▄▄██[0m │
│   [0;1;30;90m▀▀▀[0m [0;1;30;90m▀[0;1;34;94m▀[0m    [0;1;34;94m▀▀▀▀[0m       [0;34m▀▀▀▀[0m     [0;34m▀▀[0m      [0;37m▀▀▀▀▀▀▀▀[0m     [0;37m▀▀[0;1;30;90m▀▀[0m     [0;1;30;90m▀▀▀▀▀[0m    [0;1;34;94m▀▀▀▀▀▀[0m  │
│                                                                                │
│                                                            ajduncan@gmail.com  │
└────────────────────────────────────────────────────────────────────────────────┘

EOF

source_directory=$(dirname "${BASH_SOURCE}")
cd $source_directory

function dotsync {
	echo "Dottenating ~ with dots from $source_directory ..."
	cd $source_directory
	rsync --exclude ".git/" \
	--exclude ".gitignore" \
	--exclude "dotstrap.sh" \
	--exclude "README.md" \
	-avh --no-perms . ~
}

function resource {
	# additional files to source 
	source_files=".bash_profile .bash_prompt .bash_git"
	for f in $source_files
	do
		if [ -f "$f" ]; then
			echo "Sourcing $f ..."
			source $f
		fi
	done
}

# Check with the user to make sure dotfiles should be copied over.
read -p "Are you sure you want to overwrite files in your home directory with these dotfiles? [y/N] " -n 1
echo 
if [[ $REPLY =~ ^[Yy]$ ]]; then
	dotsync
	resource
	echo "Dottenated."
else
	echo "Aborted."
fi
unset dotsync
