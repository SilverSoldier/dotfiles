alias c="clear"
alias x="exit"
alias move="mv -iv"
alias copy="cp -iv"
alias ll="ls -la"
alias del="rm -rIv"
#alias tmux="tmux -2"
alias ac="apt-cache"
alias agi="apt-get install"

# general settings
if [ -f ~/.shell_options ]; then
	source ~/.shell_options
fi

# source local settings
if [ -f ~/.local_aliases ]; then
	source ~/.local_aliases
fi
