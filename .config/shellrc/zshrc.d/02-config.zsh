AUTO_NOTIFY_IGNORE+=("mc" "man" "v" "om" "omc")

ZSH_TAB_TITLE_ADDITIONAL_TERMS="kitty"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 $realpath'
