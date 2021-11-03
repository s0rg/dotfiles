# Set up the prompt

autoload -Uz promptinit;promptinit
autoload -Uz colors;colors

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

fpath+="/home/s0rg/.config/shellrc/zshcomp.d"

# Use modern completion system
autoload -Uz compinit;compinit

source /home/s0rg/.config/shellrc/path

typeset -A cd_aliases

for src in "${HOME}"/.config/shellrc/zshrc.d/*.zsh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

export SAVEHIST=5000
export HISTFILE="${XDG_CACHE_HOME}/zsh_history"

for kk in "${(@kk)cd_aliases}"; do
    function $kk() {
        local r="${cd_aliases[$0]}"
        if [ ! $# -eq 1 ]; then
            cd "$r" || return
        else
            cd "$r/${1}" || return
        fi
    }

    function _$kk() {
        ((CURRENT == 2)) && _files -/ -W $cd_aliases[${0:1}]
    }

    compdef _$kk $kk
done
unset kk

source /home/s0rg/.config/broot/launcher/bash/br
