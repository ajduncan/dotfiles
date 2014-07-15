# specify some path info
export PATH=$PATH:~/bin/
export GOPATH=$HOME/projects/go
export PATH=/usr/local/bin:$GOPATH/bin:$PATH
export PATH=/opt/chef/embedded/bin:$PATH

# editor
export EDITOR='subl -w'

# use colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias reload='source ~/.bash_profile'

# additional files to source 
SOURCE_FILES="~/.bash_prompt ~/.bash_git"

for f in $SOURCE_FILES
do
	if [ -f $f ]; then
		echo "Sourcing $f ..."
		source $f
	fi
done