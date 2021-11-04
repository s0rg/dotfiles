unsetopt FLOW_CONTROL
unsetopt MAIL_WARNING

setopt CLOBBER
setopt HASH_LIST_ALL
setopt APPEND_HISTORY INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_SAVE_NO_DUPS HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt TRANSIENT_RPROMPT

setopt COMPLETE_IN_WORD ALWAYS_TO_END
setopt AUTO_PARAM_SLASH

for src in "${HOME}"/.config/shellrc/*.sh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

typeset -U path cdpath fpath manpath

zstyle ':completion:*' use-cache on
zstyle ':completion:*' rehash true
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zcompcache
zstyle ':completion:*' complete-options true
zstyle ':completion:*' completer _extensions _expand _complete _ignored _approximate
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2

alias sh-plugs-up='antibody bundle < "${SHELLRC_HOME}"/zsh_plugins.txt > "${SHELLRC_HOME}"/zshrc.d/01-plugins.zsh'
