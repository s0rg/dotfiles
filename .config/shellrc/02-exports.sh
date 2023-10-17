export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

export EDITOR='vim'
export VISUAL='vim'
export EMAIL='evolution'
export PDF='zathura'

# ~/.local/bin/firetab
# export BROWSER='firetab'

export LESSCHARSET=utf-8
export LESS='-giXMRF --incsearch --tabs=4'

export PAGER='less'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Disable 'less' history file
export LESSHISTFILE='-'

export MTR_OPTIONS=-t

export PYTHONIOENCODING='UTF-8'

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_PLATFORMTHEME=qt5ct
export QT_PLATFORM_PLUGIN=qt5ct

export FZF_DEFAULT_OPTS="
--ansi
--cycle
--reverse
--extended
--height=40%
--padding 0
--no-mouse
--preview-window hidden,right:50%
--bind 'change:first,backward-eof:abort,esc:abort'
--bind 'ctrl-s:toggle-sort'
--bind 'ctrl-z:ignore'
--bind '?:toggle-preview'
--bind 'page-up:preview-up'
--bind 'page-down:preview-down'
"

export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_CTRL_T_COMMAND='rg --files --no-heading'

# https://secwiki.org/w/Running_nmap_as_an_unprivileged_user
export NMAP_PRIVILEGED=''

export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}"/ripgrep/ripgreprc
export DOCKER_CONFIG="${XDG_CONFIG_HOME}"/docker

# theme for bat + delta
export BAT_THEME=gruvbox-dark
