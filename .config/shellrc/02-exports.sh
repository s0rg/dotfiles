export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export EMAIL='evolution'
export PDF='zathura'
export BROWSER='qutebrowser'
export MANPAGER='less -X'

export LESS='-g -i -M -R --tabs=4'
export LESSCHARSET=utf-8

# Disable 'less' history file
export LESSHISTFILE='-'

export MTR_OPTIONS=-t

export PYTHONIOENCODING='UTF-8'

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_PLATFORMTHEME=qt5ct
export QT_PLATFORM_PLUGIN=qt5ct

export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig

export FZF_DEFAULT_OPTS="--ansi \
    --no-mouse \
    --height=40% \
    --padding 0 \
    --reverse \
    --extended \
    --bind 'change:first,backward-eof:abort,tab:down,esc:cancel' \
    --bind 'ctrl-z:ignore,ctrl-s:toggle-sort,ctrl-/:toggle-preview' \
    --preview-window hidden,right:50% \
    --preview 'bat --style=numbers --color=always --line-range :200 {}'"
export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_CTRL_T_COMMAND='rg --files --no-heading'

# https://secwiki.org/w/Running_nmap_as_an_unprivileged_user
export NMAP_PRIVILEGED=''

export XDG_CONFIG_HOME="${HOME}"/.config
export XDG_CACHE_HOME="${HOME}"/.cache
export XDG_DATA_HOME="${HOME}"/.local/share

export SHELLRC_HOME="${HOME}"/.config/shellrc

export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}"/ripgrep/ripgreprc
export DOCKER_CONFIG="${XDG_CONFIG_HOME}"/docker

# theme for bat + delta
export BAT_THEME=gruvbox-dark

export HISTSIZE=500
