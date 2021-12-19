autoload -Uz up-line-or-beginning-search down-line-or-beginning-search edit-command-line

exit_zsh() { exit; }

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line
zle -N exit_zsh

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

bindkey '^D' exit_zsh
bindkey '^x^e' edit-command-line

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

bindkey '^Q' push-input  # отложить текущую команду
bindkey '^[q' push-input # use ^[Q to push single line while at PS2
