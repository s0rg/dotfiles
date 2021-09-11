export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export LC_TIME="ru_RU.UTF-8"

export EDITOR="vim"
export PAGER="bat"

export MTR_OPTIONS=-t

export QT_QPA_PLATFORMTHEME=qt5ct
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig

export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc

export FZF_DEFAULT_OPTS="--ansi \
    --height=80% \
    --border \
    --padding 0 \
    --preview 'bat --line-range :300 {}'"
export FZF_DEFAULT_COMMAND="rg \
    --files \
    --hidden \
    --column \
    --line-number \
    --no-heading \
    --color=always \
    --smart-case "
export FZF_COMPLETION_OPTS="--border --info=inline"

