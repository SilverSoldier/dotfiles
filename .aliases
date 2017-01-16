alias c="clear"
alias x="exit"
alias move="mv -iv"
alias copy="cp -iRv"
alias ll="ls -la"
alias del="rm -rIv --preserve-root"
alias ac="apt-cache"
alias agi="sudo apt-get install"
# for easy movement
alias ..="cd .."
alias ...="cd ../.."
# mount storage
alias mstor="sudo mount /dev/sda6 /media/Storage"

# does cd and ls
cdd() { cd "$@"; ls; }

# general settings
if [ -f ~/.shell_options ]; then
	source ~/.shell_options
fi

# source local settings
if [ -f ~/.local_aliases ]; then
	source ~/.local_aliases
fi
