# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# If connected via ssh and not in tmux, attach
[[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ] && tmux attach && exit

