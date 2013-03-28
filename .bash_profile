#====================
#  ~/.bash_profile
#====================

# Source the .bashrc
if [ -e "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

#--------
#  Term
#--------

if [ "xTERM" = "xxterm" ]
then
  export TERM="xterm-256colors"
fi

#---------
#  rbenv
#---------

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#-----------
#  Exports
#-----------

# Default editor
export EDITOR="gvim"

# Add local bins to path
export PATH="$PATH:/usr/local/bin"

#---------
#  Paths
#---------

# Include private bin
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

# Include private man
if [ -d "${HOME}/man" ]; then
  MANPATH="${HOME}/man:${MANPATH}"
fi

# Include private info
if [ -d "${HOME}/info" ]; then
  INFOPATH="${HOME}/info:${INFOPATH}"
fi

#-----------
#  Aliases
#-----------

# Grep
alias grep="grep --color"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Lists
alias ll="ls -l"
alias la="ls -a"

# Copy
alias cp="cp -i"

# Move
alias mv="mv -i"

# Remove
alias rm="rm -i"

# Directories
alias vdir="ls --color=auto --format=vertical"
alias ldir="ls --color=auto --format=long"
