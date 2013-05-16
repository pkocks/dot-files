# .bashrc

# User specific aliases and functions
# source /etc/profile

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# for safety, i like the default to only be visible to me and then adjust manually later
umask 0022


#####
# Z is the new J
# . ~/tools/z.sh

#################
# Aliases

# custom aliases

# alias webhost='ssh vs-ld141.websys.aol.com'

# -> Prevents accidentally clobbering files.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# easier to jump around
alias ..='cd ..'

# set default editor
export EDITOR='vim'
export SUDO_EDITOR='vim'
if [ -d '/Applications/MacPorts/MacVim.app' ] 
then 
  alias vim='open -a MacVim'; 
  EDITOR='open -a MacVim';
  SUDO_EDITOR='mvim -f';
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


# Set the window title for screen
  case $TERM in
    screen*)
      # This is the escape sequence ESC k \w ESC \
      #Use path as title
      SCREENTITLE='\[\ek\w\e\\\]'
      #Use program name as title
      # SCREENTITLE='\[\ek\e\\\]'
      ;;
    *)
      SCREENTITLE=''
      ;;
  esac

# Turn off XON/XOFF process control to make <CTRL-s> not hang VIM and Command-T
# See: https://wincent.com/forums/command-t/topics/430
# stty -ixon
export TERM=xterm-color


# SSH PASSPHRASE
# Using ssh-agent to remember pass phrases
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initializing new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  #ps ${SSH_AGENT_PID} doesn't work under cywgin
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
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
if [ -d '/Users/pkocks/Code/llvm-b2/bin' ] ; then export PATH="$PATH:/Users/pkocks/Code/llvm-b2/bin"; fi
if [ -d '/usr/local/clang/bin' ] ; then export PATH="$PATH:/usr/local/clang/bin"; fi
if [ -d '/usr/local/bin' ] ; then export PATH="$PATH:/usr/local/bin"; fi
if [ -d '/opt/local/sbin' ] ; then export PATH="$PATH:/opt/local/sbin"; fi
if [ -d '/opt/local/bin' ] ; then export PATH="$PATH:/opt/local/bin"; fi
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

# add git command completion
if [ -f '/opt/local/share/doc/git-core/contrib/completion/git-completion.bash' ]
then
  . /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
fi
if [ -f '/usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash' ]
then
  . /usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash
fi

if [ -f '/opt/local/bin/clang' ] ; then export CC="/opt/local/bin/clang"; fi
if [ -f '/opt/local/bin/clang++' ] ; then export CXX="/opt/local/bin/clang++"; fi

function bashtips {
cat <<EOF
DIRECTORIES
-----------
~-      Previous working directory
pushd tmp   Push tmp && cd tmp
popd            Pop && cd

GLOBBING AND OUTPUT SUBSTITUTION
--------------------------------
ls a[b-dx]e Globs abe, ace, ade, axe
ls a{c,bl}e Globs ace, able
\$(ls)          \`ls\` (but nestable!)

HISTORY MANIPULATION
--------------------
!!      Last command
!?foo           Last command containing \`foo'
^foo^bar^   Last command containing \`foo', but substitute \`bar'
!!:0            Last command word
!!:^            Last command's first argument
!\$     Last command's last argument
!!:*            Last command's arguments
!!:x-y          Arguments x to y of last command
C-s     search forwards in history
C-r     search backwards in history

LINE EDITING
------------
M-d     kill to end of word
C-w     kill to beginning of word
C-k     kill to end of line
C-u     kill to beginning of line
M-r     revert all modifications to current line
C-]     search forwards in line
M-C-]           search backwards in line
C-t     transpose characters
M-t     transpose words
M-u     uppercase word
M-l     lowercase word
M-c     capitalize word

COMPLETION
----------
M-/     complete filename
M-~     complete user name
M-@     complete host name
M-\$            complete variable name
M-!     complete command name
M-^     complete history
EOF
}
