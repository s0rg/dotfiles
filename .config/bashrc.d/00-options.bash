# common shell options
shopt -s checkwinsize
shopt -s globstar
shopt -s nocaseglob
shopt -s no_empty_cmd_completion

if [[ $- == *i* ]]; then
    # disable C-s/q lock on interactive shells
    stty -ixon
    # tab == 4 spaces
    tabs -4
fi

