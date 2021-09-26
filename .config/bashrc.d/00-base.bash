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

export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_CACHE_HOME="${HOME}"/.cache
export XDG_DATA_HOME="${HOME}"/.local/share

case $- in
  *i*) ;;
  *) return;;
esac

# disable C-s/q lock on interactive shells
stty -ixon

# tab == 4 spaces
tabs -4

umask 022

# common shell options
shopt -s checkwinsize
shopt -s globstar
shopt -s nocaseglob
shopt -s no_empty_cmd_completion

