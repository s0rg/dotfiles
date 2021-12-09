setopt NO_BEEP NO_HIST_BEEP NO_LIST_BEEP
setopt NO_FLOW_CONTROL
setopt NO_MAIL_WARNING
setopt NO_AUTO_CD 
setopt NO_PUSHD_TO_HOME

setopt ALIASES 
setopt CLOBBER
setopt HASH_LIST_ALL
setopt AUTO_PARAM_SLASH
setopt TRANSIENT_RPROMPT

setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

setopt SHARE_HISTORY
setopt APPEND_HISTORY
# setopt INC_APPEND_HISTORY
setopt HIST_FCNTL_LOCK
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS

export DIRSTACKSIZE=10

export ZLE_SPACE_SUFFIX_CHARS='&|'

set zle_bracketed_paste  # Explicitly restore this zsh default

autoload -Uz bracketed-paste-magic url-quote-magic

zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

typeset -U path cdpath fpath manpath

zle_highlight+=(paste:none)

zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' keep-prefix true
zstyle ':completion:*' insert-tab pending
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zcompcache
zstyle ':completion:*' completer _expand _extensions _complete _ignored _approximate
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'

zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:(rm|kill):*' ignore-line yes
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps --forest -u $USER -o pid,%cpu,%mem,cmd"

cd_aliases+=(
    [cdp]="${HOME}/projects"
    [cdc]="${HOME}/.config"
)

for src in "${HOME}"/.config/shellrc/*.sh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# don't append "not found command" to history
# https://www.zsh.org/mla/users//2014/msg00715.html
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

declare -aU IGNORE_CMD=(
    "?" "??" "[bf]g" "pwd" "clear" "env" "exit" "reset" # one / two-letters commands and tools
    "dots-*" "dots *" "higr *"                          # dotfiles and history management
    "rm *" "kill *" "killall *"                         # one-shot commands, literally
    "ps *" "pstree" "[h]top" "gotop"                    # process / system info
    "man *" "* --help" "* --version"                    # info and manuals
    "obey" "sudo *" "*KEY*" "*TOKEN*"                   # security
    "l[ls]#( *)" "up# *" "cd# *" "md *" "omc" "top-*"   # all others
    "uuid" "nscan-*" "t *" "wttr" "heads *" "yt[dav] *"
    "dps" "groot" "chx *" "cd[cplst]# *" "cal" "z8[dj]"
    "ex *" "get *" "unx *" "mtr" "pub-clip" "pip-get *"
    "bak *" "sh-*" "upp"
)

joined=""

for i in "${IGNORE_CMD[@]}"; do
    if [ -n "${joined}" ]; then
        joined="${joined}|${i}"
    else
        joined="${i}"
    fi
done

export HISTORY_IGNORE="(${joined})"
unset joined

alias sh-plugs-up='antibody bundle < "${SHELLRC_HOME}"/zsh_plugins.txt > "${SHELLRC_HOME}"/plugins.zsh; antibody update'
