# /etc/bash/bashrc

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
HISTFILESIZE=10000000

# Tmux stuff
# If not running interactively, do not do anything
alias tmux="TERM=screen-256color tmux"
[[ $- != *i* ]] && return
if [[ -z "$TMUX" ]] && [[ $TERM != linux ]]; then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi
# Change pane_title to local or ssh IP
ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        printf "\033]2;ssh:`echo $* | awk '{print $NF}'`\033\\"
        command ssh "$@" && printf "\033]2;local:`ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d : -f 2`\033\\"
    else
        command ssh "$@"
    fi
}
if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        printf "\033]2;local:`ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d : -f 2`\033\\"
fi 

# Change the window title of X terminals 
case ${TERM} in
	[aEkx]term*|rxvt*|gnome*|konsole*|interix)
		PS1='\[\033]0;\u@\h:\w\007\]'
		;;
	screen*)
		PS1='\[\033k\u@\h:\w\033\\\]' && export PROMPT_COMMAND='echo -n -e "\033k\033\\"'
		;;
	*)
		unset PS1
		;;
esac

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.
use_color=false
if type -P dircolors >/dev/null ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	LS_COLORS=
	if [[ -f ~/.dir_colors ]] ; then
		# If you have a custom file, chances are high that it's not the default.
		used_default_dircolors="no"
		eval "$(dircolors -b ~/.dir_colors)"
	elif [[ -f /etc/DIR_COLORS ]] ; then
		# People might have customized the system database.
		used_default_dircolors="maybe"
		eval "$(dircolors -b /etc/DIR_COLORS)"
		used_default_dircolors="yes"
		eval "$(dircolors -b)"
	fi
	if [[ -n ${LS_COLORS:+set} ]] ; then
		use_color=true

		# The majority of systems out there do not customize these files, so we
		# want to avoid always exporting the large $LS_COLORS variable.  This
		# keeps the active env smaller, and it means we don't have to deal with
		# running new/old (incompatible) versions of `ls` compared to when we
		# last sourced this file.
		case ${used_default_dircolors} in
		no) ;;
		yes) unset LS_COLORS ;;
		*)
			ls_colors=$(eval "$(dircolors -b)"; echo "${LS_COLORS}")
			if [[ ${ls_colors} == "${LS_COLORS}" ]] ; then
				unset LS_COLORS
			fi
			;;
		esac
	fi
	unset used_default_dircolors
else
	# Some systems (e.g. BSD & embedded) don't typically come with
	# dircolors so we need to hardcode some terminals in here.
	case ${TERM} in
	[aEkx]term*|rxvt*|gnome*|konsole*|screen|cons25|*color) use_color=true;;
	esac
fi

if ${use_color} ; then
	if [[ ${EUID} == 0 ]] ; then
		PS1+='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
	else
		PS1+='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
	fi

	if [ "$(uname)" == "Darwin" ]; then
		export CLICOLOR=1
		alias ls='ls -G'
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        alias ls='ls --color=auto'
	fi	
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1+='\u@\h \W \$ '
	else
		PS1+='\u@\h \W \$ '
	fi
fi

export GOPATH=$HOME/.gopath
export PATH=$GOPATH:$GOPATH/bin:~/bin/:$PATH

test -s ~/.bash_aliases && . ~/.bash_aliases || true

GPG_TTY=$(tty)
export GPG_TTY

# Disable flow control in .bashrc for vim mapping
vim()
{
	local STTYOPTS="$(stty -g)"
	stty stop '' -ixoff
	command vim "$@"
	stty "$STTYOPTS"
}

# Try to keep environment pollution down, EPA loves us.
unset use_color sh

# export my 42email
# export MAIL='rjeraldi@student.21-school.ru'
