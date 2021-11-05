# Colors
COLORS_PROMPT=black
COLORS_HOST=blue
COLORS_DIR=green
COLORS_GIT_BRANCH=black
COLORS_GIT_STAGED=red
COLORS_GIT_UNSTAGED=yellow

autoload -Uz add-zsh-hook vcs_info

zstyle ':vcs_info:*'     enable    git
zstyle ':vcs_info:git:*' check-for-staged-changes true
zstyle ':vcs_info:*'     unstagedstr   "%F{$COLORS_GIT_UNSTAGED}*"
zstyle ':vcs_info:*'     stagedstr     "%F{$COLORS_GIT_STAGED}+"
zstyle ':vcs_info:git:*' formats       " %F{$COLORS_GIT_BRANCH}%b %u%c"
zstyle ':vcs_info:git:*' actionformats " %F{$COLORS_GIT_BRANCH}%b|%a %u%c"

_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%F{$COLORS_HOST}$me"
  fi
}

_reset() {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

setopt PROMPT_SUBST

add-zsh-hook -Uz precmd _reset
add-zsh-hook -Uz precmd vcs_info

PS1=' %B%F{$COLORS_DIR}%c%b %F{$COLORS_PROMPT}▶%f '
PS2=' %F{$COLORS_PROMPT}>%f '

if ! ps $PPID | grep mc; then
    RPROMPT='${vcs_info_msg_0_}$(_host)%f '
fi
