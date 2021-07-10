case $- in
    *i*) ;;
      *) return;;
esac

# common history for all sessions
export SHELL_SESSION_HISTORY=0

export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s autocd

# say no to flow control
stty -ixon

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

GOVERSION='1.16'

export GO111MODULE=auto
export GOPROXY=direct
export GOSUMDB=off
export GOROOT=/usr/local/go${GOVERSION}
export GOPATH=$HOME/projects/go

export MTR_OPTIONS=-t

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS="--ansi \
    --height=80% \
    --border \
    --padding 0 \
    --preview 'bat --line-range :300 {}'"
export FZF_DEFAULT_COMMAND='rg --files --column --line-number --no-heading --color=always --smart-case '

export QT_QPA_PLATFORMTHEME=qt5ct

export PATH=$PATH:/usr/local/go${GOVERSION}/bin:${GOPATH}/bin:/snap/bin:$HOME/Telegram
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

# local aliases - last to override any others.
if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi

if [ -f ~/.aliases_local.sh ]; then
    . ~/.aliases_local.sh
fi

