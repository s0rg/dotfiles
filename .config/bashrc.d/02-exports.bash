export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export BROWSER='qutebrowser'
export MAILER='evolution'
export MANPAGER='less -X'

export LESS='-g -i -M -R -S -w -X -z-4'

# Colorful manpages using less
# see: https://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[46;30m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'

# Disable 'less' history file
export LESSHISTFILE='-'

export MTR_OPTIONS=-t

export QT_QPA_PLATFORMTHEME=qt5ct
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig

export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc

export FZF_DEFAULT_OPTS="--ansi \
    --height=60% \
    --border \
    --padding 0 \
    --reverse \
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

