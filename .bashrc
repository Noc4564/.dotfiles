#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(dircolors -b ~/.dircolors)"
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
shopt -s extglob
