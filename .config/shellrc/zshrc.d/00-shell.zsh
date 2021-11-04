unsetopt FLOW_CONTROL

setopt SHARE_HISTORY APPEND_HISTORY INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS

setopt CORRECT CORRECT_ALL

setopt COMPLETE_IN_WORD ALWAYS_TO_END
setopt AUTO_PARAM_SLASH

for src in "${HOME}"/.config/shellrc/*.sh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

zstyle ':completion:*' use-cache on
zstyle ':completion:*' rehash true
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zcompcache
zstyle ':completion:*' complete-options true
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias sh-plugs-up='antibody bundle < "${SHELLRC_HOME}"/zsh_plugins.txt > "${SHELLRC_HOME}"/zshrc.d/01-plugins.zsh'
