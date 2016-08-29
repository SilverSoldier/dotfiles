alias c="clear"
alias x="exit"
alias move="mv -i"
alias ll="ls -la"

# general settings
if [ -f ~/.shell_options ]; then
	source ~/.shell_options
fi

# source local settings
if [ -f ~/.local_aliases ]; then
	source ~/.local_aliases
fi
