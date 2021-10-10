# shell options: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s cdspell
shopt -s checkjobs
shopt -s checkhash
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete
shopt -s huponexit
shopt -s nocaseglob
shopt -s no_empty_cmd_completion

# disable C-[sq] flow control
stty -ixon

# tab == 4 spaces
tabs -4

umask 022
