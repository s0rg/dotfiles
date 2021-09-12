# eye-candy output
alias ls='ls --color=auto --group-directories-first'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias dmesg='dmesg --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias less='less -R'
alias ncdu='ncdu --color dark'

# misc
alias v='vim'
alias mc='mc -d'
alias si='sudo -i'
alias up='cd ..'
alias tailf='tail -f --retry'
alias wttr='curl http://wttr.in/?format="%c:+%f+%w\n"'
alias enru='trans en:ru'
alias ruen='trans ru:en'
alias cal='echo; ncal -M -3; echo'
alias hig='history | grep'
alias clip='xclip -sel clip'
alias pub-clip='cat ~/.ssh/id_rsa.pub | clip'
alias ncdu-home='ncdu "$HOME"'
alias rot13='tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"; echo'

# post-traumatic syndrome
alias q='exit'
alias :q='exit'

# fast travel
alias cdp='cd ~/projects'
alias cdd='cd ~/Documents'
alias cdl='cd ~/Downloads && fresh'

# system
alias top-mem='ps -Ao user,pid,pcpu,pmem,comm --sort=-pmem | head --lines=6'
alias top-cpu='ps -Ao user,pid,pcpu,pmem,comm --sort=-pcpu | head --lines=6'
alias inet-ports='netstat -nape --inet'

# python
alias py='python3'
alias bp='bpython'
alias pip-up='pip3 install --upgrade --user $(pip3 list --user --format json | jq ".[] | flatten | .[0]" | xargs echo)'
alias pip-get='pip3 install --user --upgrade'
alias py-serve='python3 -m http.server'
alias py-clear='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

# youtube-dl
alias yta="youtube-dl --extract-audio --audio-format best"
alias ytv="youtube-dl -f bestvideo+bestaudio"

# extras
alias tree='exa --icons --group-directories-first --tree --level=2 --git-ignore'
alias lsx='exa --icons --group-directories-first --long --header --git --colour-scale --time-style=long-iso'
alias dfx='duf --hide special'
alias gr='rg'

# docker
alias di-up="docker images -f 'dangling=false' --format '{{.Repository}}:{{.Tag}}' | xargs -L1 docker pull"
alias di-clr="docker images -f 'dangling=true' -q | xargs -L1 docker rmi"
alias dps='docker ps -a'
alias dcu='docker-compose up'
alias dcd='docker-compose down --remove-orphans'
alias dcb='docker-compose build'

# golang
alias go-clean='go clean -cache -testcache -modcache'
alias go-deps="go list -f '{{join .Deps \"\n\"}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"
alias go-bench='go test -benchmem -bench=.'
alias go-test='go test -count 1 -v .'
alias go-noproxy='export GOPROXY='

# git
alias git-gc='git reflog expire --all --expire=now && git gc --prune=now --aggressive'
alias git-amend='git commit -a --amend'
alias git-born='git log --pretty="format:%ar at %ai" --reverse | head -1'
alias git-origin='git config --get remote.origin.url'
alias git-prune='git fetch --prune origin'
alias git-log='git log --all --decorate --oneline --graph --stat'
alias git-root='cd $(git rev-parse --show-toplevel)'
alias git-forget='git update-index --assume-unchanged'
alias git-remember='git update-index --no-assume-unchanged'
alias git-rm-merged='git branch --no-color --merged | grep -v -e "^\* " -e "^\  ma" | xargs -n 1 git branch -d'

alias gis='git status'
alias gic='git commit -am '

# kitty
alias kitty-up='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias ssh='kitty +kitten ssh'
alias kat='kitty +kitten icat'

# dotfiles
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots-vim-plugs='vim-plugs-ls > $HOME/.vim/plugins-list'
__git_complete dots git

# kubernetes
alias k='kubectl'
alias kns='k ns'
alias kctx='k ctx'
alias kpods='k get pods'
alias kapt='k krew'
alias kapt-up='kapt upgrade'
complete -F __start_kubectl k

