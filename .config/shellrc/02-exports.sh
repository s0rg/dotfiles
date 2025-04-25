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

# Disable 'less' history file
export LESSHISTFILE='-'

export MTR_OPTIONS=-t

export PYTHONIOENCODING='UTF-8'

export QT_QPA_PLATFORMTHEME=qt5ct
export QT_PLATFORMTHEME=qt5ct
export QT_PLATFORM_PLUGIN=qt5ct

### FZF

export FZF_DEFAULT_OPTS="
--ansi
--cycle
--reverse
--extended
--height=40%
--padding 0
--no-mouse
--preview-window hidden
--bind 'change:first,backward-eof:abort,esc:abort'
--bind 'ctrl-s:toggle-sort'
--bind 'ctrl-z:ignore'
--bind '?:toggle-preview'
--bind 'page-up:preview-up'
--bind 'page-down:preview-down'
"

export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --exclude .git'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview-window nohidden --preview 'batcat -n --line-range :100 {}'"

export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

#export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

eval "$(fzf --zsh)"

# https://secwiki.org/w/Running_nmap_as_an_unprivileged_user
export NMAP_PRIVILEGED=''

export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}"/ripgrep/ripgreprc
export DOCKER_CONFIG="${XDG_CONFIG_HOME}"/docker

# theme for bat + delta
export BAT_THEME=gruvbox-dark
