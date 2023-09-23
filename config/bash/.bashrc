#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# User
if [ -n "$RANGER_LEVEL" ]; then 
    export PS1="[ranger]$PS1"
fi

# Zoxide
eval "$(zoxide init bash)"
