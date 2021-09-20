export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export EMAIL='evolution'
export BROWSER='qutebrowser'
export MANPAGER='less -X'

export LESS='-g -i -M -R -S -w -z-4 --tabs=4'
export LESSCHARSET=utf-8

# Disable 'less' history file
export LESSHISTFILE='-'

export MTR_OPTIONS=-t

export PYTHONIOENCODING='UTF-8'

export QT_QPA_PLATFORMTHEME=qt5ct

export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig

export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc

export FZF_DEFAULT_OPTS="--ansi \
    --height=60% \
    --border \
    --padding 0 \
    --reverse \
    --bind 'esc:cancel' \
    --preview 'bat -n --color=always {}'"
export FZF_DEFAULT_COMMAND="rg \
    --files \
    --hidden \
    --column \
    --line-number \
    --no-heading \
    --color=always \
    --smart-case "
export FZF_COMPLETION_OPTS="--border --info=inline"

# https://secwiki.org/w/Running_nmap_as_an_unprivileged_user
export NMAP_PRIVILEGED=''

