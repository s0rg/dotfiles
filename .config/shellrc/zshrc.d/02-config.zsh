AUTO_NOTIFY_IGNORE=("mc" "man" "v" "om" "omc" "top" "htop" "gotop" "less" "tailf" "tail")
declare -U AUTO_NOTIFY_IGNORE

export AUTO_NOTIFY_EXPIRE_TIME=3000
export AUTO_NOTIFY_IGNORE
export ZSH_TAB_TITLE_ADDITIONAL_TERMS="kitty"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always --almost-all --group-directories-first -v1 $realpath'
