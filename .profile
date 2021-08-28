GOVERSION='1.17'

export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export LC_TIME="ru_RU.UTF-8"

export EDITOR="vim"

export GO111MODULE=auto
export GOPROXY=direct
export GOSUMDB=off
export GOROOT=/usr/local/go${GOVERSION}
export GOPATH=$HOME/projects/go

export MTR_OPTIONS=-t

export RIPGREP_CONFIG_PATH=~/config/ripgrep/ripgreprc

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS="--ansi \
    --height=80% \
    --border \
    --padding 0 \
    --preview 'bat --line-range :300 {}'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --column --line-number --no-heading --color=always --smart-case '

export QT_QPA_PLATFORMTHEME=qt5ct

export PATH=$PATH:/usr/local/go${GOVERSION}/bin:${GOPATH}/bin:/snap/bin:$HOME/Telegram
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

if [ -d "$HOME/.local/scripts" ]; then
    export PATH=$HOME/.local/scripts:$PATH
fi

# if running bash
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
