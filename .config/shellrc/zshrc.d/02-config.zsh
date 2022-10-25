AUTO_NOTIFY_IGNORE=(
	"mc" "man" "v" "om" "omc" "si"
	"top" "htop" "gotop" "less" "tailf" "tail"
	"g ll" "g did" "dots ll" "dots did"
)

declare -U AUTO_NOTIFY_IGNORE

export AUTO_NOTIFY_IGNORE
export AUTO_NOTIFY_EXPIRE_TIME=3000
export ZSH_TAB_TITLE_ADDITIONAL_TERMS="kitty"

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete bracketed-paste accept-line push-line-or-edit)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS
export ZSH_AUTOSUGGEST_MANUAL_REBIND="yes"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export WORDCHARS='-~!#$%^&*(){}[]<>?.+;_'

zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' query-string prefix first
zstyle ':fzf-tab:complete:*:*' fzf-preview '
if [ -d "$realpath" ]; then
    ls --color=always --almost-all --group-directories-first -v1 $realpath | head -n 22
else
    bat --color=always --style=numbers $realpath --line-range :22
fi'
