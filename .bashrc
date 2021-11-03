# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\W\[\033[00m\] \[\033[30m\]▶\[\033[00m\] '
    PS2='\[\033[30m\]>\[\033[00m\] '
else
    PS1='( ${debian_chroot:+($debian_chroot)}\W )\▶ '
    PS2='> '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;

esac

source /home/s0rg/.config/shellrc/path

case $- in
*i*) ;;
*)
    return
    ;;
esac

source /home/s0rg/.config/shellrc/bashrc.d/init.bash

source /home/s0rg/.config/broot/launcher/bash/br
