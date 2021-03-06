# specify some path info
export PATH=$PATH:~/bin
export GOPATH=$HOME/projects/go
export PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH
# export PATH=/opt/chef/embedded/bin:$PATH

# Mono assembly happification
export MONO_GAC_PREFIX="/usr/local"

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

# autoenv for python
# if [ -f /usr/local/opt/autoenv/activate.sh ]; then
#   source /usr/local/opt/autoenv/activate.sh
# fi

# source other files as needed
source_files=".bash_prompt .bash_git"
for f in $source_files
do
	if [ -f "$f" ]; then
		source $f
	fi
done
