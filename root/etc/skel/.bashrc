#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export VISUAL=nvim
alias vim=nvim
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
