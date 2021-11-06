AUTO_NOTIFY_IGNORE=(
    "mc" "man" "v" "om" "omc" "si"
    "top" "htop" "gotop" "less" "tailf" "tail"
    "g ll" "g did" "dots ll" "dots did"
)

declare -U AUTO_NOTIFY_IGNORE

export AUTO_NOTIFY_IGNORE
export AUTO_NOTIFY_EXPIRE_TIME=3000
export ZSH_TAB_TITLE_ADDITIONAL_TERMS="kitty"
export ZSH_AUTOSUGGEST_MANUAL_REBIND="yes"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS
export WORDCHARS='~!#$%^&*(){}[]<>?.+;'

zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' query-string prefix first
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always --almost-all --group-directories-first -v1 $realpath'
