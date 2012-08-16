# .bashrc

# User specific aliases and functions
# source /etc/profile

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# custom aliases

# -> Prevents accidentally clobbering files.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# better grep
alias ack='ack-grep'

# set default editor
export EDITOR=vim
if [ -f '/Applications/MacPorts/MacVim.app/Contents/MacOS/MacVim' ] 
then 
  alias vim='open -a MacVim'; 
  EDITOR='open -Wn MacVim';
fi 



# force colors on ls
alias ls='ls -FB'
export CLICOLOR=1
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit
export LSCOLORS='HxfxcxdxBxegedabagacad'


# force colors on grep
alias grep='grep --color=AUTO'
alias fgrep='fgrep --color=AUTO'


# Turn off XON/XOFF process control to make <CTRL-s> not hang VIM and Command-T
# See: https://wincent.com/forums/command-t/topics/430
stty -ixon
export TERM=xterm-256color


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi



set -o vi


function prompt
{
  local WHITE="\[\033[1;37m\]"
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local GRAY="\[\033[0;37m\]"
  local BLUE="\[\033[0;34m\]"
  local YELLOW="\[\033[1;33m\]"
  export PS1="${GRAY}\h:${YELLOW}\W${CYAN} $ ${WHITE} "
  # export PS1=" ${GRAY} $PS1"
}
prompt

# the most localized path first
export PATH='.'
if [ -d '/usr/local/bin' ] ; then export PATH="$PATH:/usr/local/bin"; fi
if [ -d '/usr/local/sbin' ] ; then export PATH="$PATH:/usr/local/sbin"; fi
if [ -d '/usr/local/bin' ] ; then export PATH="$PATH:/usr/local/bin"; fi
if [ -d '/sbin' ] ; then export PATH="$PATH:/sbin"; fi
if [ -d '/bin' ] ; then export PATH="$PATH:/bin"; fi
if [ -d '/usr/sbin' ] ; then export PATH="$PATH:/usr/sbin"; fi
if [ -d '/usr/bin' ] ; then export PATH="$PATH:/usr/bin"; fi

export MANPATH='.'
if [ -d '/opt/local/share/man' ] ; then export MANPATH="$MANPATH:/opt/local/share/man"; fi
if [ -d '/usr/local/share/man' ] ; then export MANPATH="$MANPATH:/usr/local/share/man"; fi
if [ -d '/usr/share/man' ] ; then export MANPATH="$MANPATH:/usr/share/man"; fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi



