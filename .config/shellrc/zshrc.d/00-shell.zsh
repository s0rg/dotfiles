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
setopt HIST_FCNTL_LOCK
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS

export DIRSTACKSIZE=5

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
zstyle ':completion:*' completer _complete _match _expand _extensions _ignored _approximate
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'

zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:(rm|kill):*' ignore-line yes
zstyle ':completion:complete:*:options' sort false
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps --forest -u $USER -o pid,%cpu,%mem,cmd"

zstyle ':antidote:bundle' use-friendly-names 'yes'

cd_aliases+=(
    [cdp]="${HOME}/projects"
    [cdc]="${HOME}/.config"
    [cdm]="/media/${USER}"
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
    "?" "??" "[bf]g" "clear" "exit" "reset"   # one / two-letters commands and tools
    "dots *" "sudo *"                         # dotfiles and sudo
    "rm *" "kill *" "killall *"               # one-shot commands, literally
    "man *" "* --help" "* --version"          # info and manuals
    "*KEY*" "*TOKEN*"                         # security
    "l[ls]#( *)" "up# *" "cd# *" "md *"       # all others
    "omc" "nscan-*" "t *" "wttr" "heads *"
    "yt[dav] *" "chx *" "cd[cplstm]# *" 
    "cal" "get *" "unx *" "mtr" "pip-get *"
    "bak *" "sh-*" "lst" "ps *"
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

alias sh-plugs-up='antidote bundle < \
    "${SHELLRC_HOME}"/.zsh_plugins.txt > \
    "${SHELLRC_HOME}"/.zsh_plugins.zsh; \
    antidote update'
