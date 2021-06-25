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

# tools
alias v='vim'
alias mc='mc -d'
alias tailf='tail -f'
alias wttr='curl http://wttr.in/?format="%c:+%f+%w\n"'
alias ru-tran='trans :ru'

# python shortcuts
alias bp='bpython-curses'
alias py='python3'
alias py-serve='python3 -m http.server'

# docker stuff
alias dci-up="docker images -f 'dangling=false' --format '{{.Repository}}:{{.Tag}}' | grep -v space307 | xargs -L1 docker pull"
alias dci-clr="docker images -f 'dangling=true' -q | xargs -L1 docker rmi"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# go
alias go-clean="go clean -cache -testcache -modcache"
alias cdgo="cd $GOPATH/src/github.com/$USER"

# git
alias git-gc="git reflog expire --all --expire=now && git gc --prune=now --aggressive"
alias git-born="git log --pretty='format:%ar at %ai' --reverse | head -1"
alias git-origin="git remote show origin"

# kitty
source <(kitty + complete setup bash)
alias kitty-up='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias ssh='kitty +kitten ssh'

# qtile shortcuts
alias qtail='tail -f $HOME/.local/share/qtile/qtile.log'
alias qhome='cd $HOME/.config/qtile'

# dotfiles management
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# add some auto-complete words
complete -W "add status commit push log checkout diff" dotfiles

