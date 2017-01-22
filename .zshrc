# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/gkavya/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

prompt walters

bindkey '^R' history-incremental-search-backward # ctrl-r
bindkey '^A' beginning-of-line  # Ctrl-A goto beginning of line
bindkey '^E' end-of-line # Ctrl-E goto end of line
bindkey '^K' kill-whole-line # ctrl-k

# grep for running process, like: 'any vim'
any() {
	if [[ -z "$1" ]] ; then
		echo "any - grep for process(es) by keyword" >&2
		echo "Usage: any <keyword>" >&2 ; return 1
	else
		local STRING=$1
		local LENGTH=$(expr length $STRING)
		local FIRSCHAR=$(echo $(expr substr $STRING 1 1))
		local REST=$(echo $(expr substr $STRING 2 $LENGTH))
		ps xauwww| grep "[$FIRSCHAR]$REST"
	fi
}

# set options

# [unset] If a completion ends with a slash and you type another slash, remove one of them
setopt auto_remove_slash

# [set] append a slash if completion target was a directory
setopt auto_param_slash 

# [unset] enables you to omit 'cd' before a path
setopt auto_cd 

# report the status of backgrounds jobs immediately
setopt notify 

# Report the status of background and suspended jobs before exiting a shell
# with job control; a second attempt to exit the shell will succeed.
setopt checkjobs

autoload colors

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

setopt rm_star_wait # Wait 10 seconds before executing "rm *"

# Don't let ../<tab> match $PWD
zstyle ':completion:*' ignore-parents parent pwd
