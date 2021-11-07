# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

fpath+=(/home/s0rg/.config/shellrc/zsh-completions)

source /home/s0rg/.config/shellrc/plugins.zsh

export ZSH_COMPDUMP=${HOME}/.cache/zcompdump

autoload -Uz compinit

_setup_compdump() {
    compinit -i -d "${ZSH_COMPDUMP}"
    local zwc
    zwc="${ZSH_COMPDUMP}".zwc
    if [[ (! -f "${zwc}" || "${ZSH_COMPDUMP}" -nt "${zwc}") ]]; then
        zcompile -M "${ZSH_COMPDUMP}"
    fi
}

if [ ! -f "${ZSH_COMPDUMP}" ]; then
    _setup_compdump
else
    setopt EXTENDEDGLOB
    for _ in "${ZSH_COMPDUMP}"(#qN.mh+8); do
        _setup_compdump
    done
    setopt NO_EXTENDEDGLOB
fi

compinit -C -d "${ZSH_COMPDUMP}"

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
