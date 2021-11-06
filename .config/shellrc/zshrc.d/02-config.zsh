AUTO_NOTIFY_IGNORE=(
    "mc" "man" "v" "om" "omc"
    "top" "htop" "gotop"
    "less" "tailf" "tail"
    "g *" "dots *"
)

declare -U AUTO_NOTIFY_IGNORE

export AUTO_NOTIFY_IGNORE
export AUTO_NOTIFY_EXPIRE_TIME=3000
export ZSH_TAB_TITLE_ADDITIONAL_TERMS="kitty"
export ZSH_AUTOSUGGEST_MANUAL_REBIND="yes"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always --almost-all --group-directories-first -v1 $realpath'
