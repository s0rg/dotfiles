# Colors
COLORS_PROMPT=black
COLORS_HOST=blue
COLORS_DIR=green
COLORS_GIT_CLEAN=black
COLORS_GIT_DIRTY=red


autoload -Uz vcs_info
zstyle ':vcs_info:*'     enable    git
zstyle ':vcs_info:git:*' formats   "%F{$COLORS_GIT_CLEAN}%c%b%f"
zstyle ':vcs_info:git:*' stagedstr "%F{$COLORS_GIT_DIRTY}"
zstyle ':vcs_info:git:*' check-for-staged-changes true

add-zsh-hook precmd vcs_info

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

_dir() {
  echo -n "%F{$COLORS_DIR}%c"
}

_ps1() {
  echo -n "%F{$COLORS_PROMPT}▶"
}

_ps2() {
  echo -n "%F{$COLORS_PROMPT}>"
}

# Enable redrawing of prompt variables
setopt promptsubst

PS1=' %B$(_dir)%b $(_ps1)%f '
PS2='$(_ps2)%f '
RPROMPT='${vcs_info_msg_0_}$(_host)%f '
