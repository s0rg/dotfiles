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
    PS1='\[\033[30m\](\[\033[00m\] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\W\[\033[00m\] \[\033[30m\])$\[\033[00m\] '
    PS2='\[\033[30m\]>\[\033[00m\] '
else
    PS1='( ${debian_chroot:+($debian_chroot)}\W )\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;

esac

export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_CACHE_HOME="${HOME}"/.cache
export XDG_DATA_HOME="${HOME}"/.local/share

if [ -d "${HOME}/.local/bin" ]; then
    PATH=${PATH}:${HOME}/.local/bin
fi

if [ -d "${HOME}/.local/scripts" ]; then
    PATH=${PATH}:${HOME}/.local/scripts
fi

if [ -d "${HOME}/.krew" ]; then
    PATH=${PATH}:${HOME}/.krew/bin
fi

export PATH=${PATH}:/snap/bin:${HOME}/Telegram

case $- in
*i*) ;;

*)
    return
    ;;
esac

for src in "${XDG_CONFIG_HOME}"/bashrc.d/*.bash; do
    [ -r "${src}" ] && . "${src}"
done
unset src
