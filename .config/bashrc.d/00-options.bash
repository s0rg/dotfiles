# common shell options
shopt -s checkwinsize
shopt -s globstar
shopt -s nocaseglob
shopt -s no_empty_cmd_completion

# disable C-s/q lock on interactive shells
[[ $- == *i* ]] && stty -ixon

