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

function dotsync {
	echo "Dottenating ~ with dots from $source_directory ..."
	cd $source_directory
	rsync --exclude ".git/" \
	--exclude ".gitignore" \
	--exclude "dotstrap.sh" \
	--exclude "README.md" \
	-avh --no-perms . ~
}

# Check with the user to make sure dotfiles should be copied over.
read -p "Are you sure you want to overwrite files in your home directory with these dotfiles? [y/N] " -n 1
echo 
if [[ $REPLY =~ ^[Yy]$ ]]; then
	dotsync
	if [ -f ~/.bash_profile ]; then
		echo "re-sourcing ~/.bash_profile..."
		source ~/.bash_profile
	fi
	echo "Dottenated."
else
	echo "Aborted."
fi
unset dotsync
