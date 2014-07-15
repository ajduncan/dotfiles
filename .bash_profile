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

# have a pretty prompt
export TERM="xterm-color"
export PS1='\[\e[0;36m\]\u\[\e[0m\]\[\e[0;31m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '