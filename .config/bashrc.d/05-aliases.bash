# enable aliases to be sudo’ed
alias sudo='sudo '

# eye-candy output
alias ls='ls --color=auto --group-directories-first'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias dmesg='dmesg --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ncdu='ncdu --color dark'

# shorthands
alias v='vim'
alias mc='mc -d'
alias si='sudo -i'
alias ex='7z x'
alias jsp='jq -C .'
alias tailf='tail -f --retry'
alias cal='echo; ncal -M -3; echo'
alias zat='zathura'
alias path='echo -e ${PATH//:/\\n}'

# lower / upper case mass rename
alias ren-lc='rename "y/A-Z/a-z/" *'
alias ren-uc='rename "y/a-z/A-Z/" *'

# tools
alias rot13='tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"; echo'
alias stats='sort | uniq -c | sort -n -r'
alias heads='curl -sI'

# translator
alias enru='trans en:ru'
alias ruen='trans ru:en'

# clipboard
alias clip-get='xclip -selection clipboard -target STRING -out'
alias clip-put='xclip -selection clipboard -target STRING -in'
alias pub-clip='cat ${HOME}/.ssh/id_rsa.pub | clip-put'

# command-history helpers
alias hig='history | rg'
alias hclear='history -c; history -w'
alias hstats='history | cut -d"]" -f 2- | stats | head'

# fast travel
alias cdp='cd ~/projects'
alias cdd='cd ~/Documents'
alias cdb='cd ~/Documents/Books'
alias cdl='cd ~/Downloads && lst'
alias cds='cd ~/.local/scripts'

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
alias py-clear='find . | grep -E "(__pycache__|\.py[co]$)" | xargs rm -rf'

# youtube-dl
alias yta="youtube-dl --extract-audio --audio-format best"
alias ytv="youtube-dl -f bestvideo+bestaudio"

# extras
alias wttr='curl http://wttr.in/?format="%c:+%f+%w\n"'
alias tree='exa --icons --group-directories-first --tree --level=2 --git-ignore'
alias lsx='exa --icons --group-directories-first --long --header --git --colour-scale --time-style=long-iso'
alias dfx='duf --hide special'
alias gr='rg'

# docker
alias doi-up="docker images -f 'dangling=false' --format '{{.Repository}}:{{.Tag}}' | xargs -L1 docker pull"
alias doi-clr="docker images -f 'dangling=true' -q | xargs -L1 docker rmi"
alias dps='docker ps -a'
alias dcu='docker-compose up --remove-orphans'
alias dcd='docker-compose down --remove-orphans'
alias dcb='docker-compose build --force-rm'
alias dcl='docker-compose logs -f'

# golang
alias go-clean='go clean -cache -testcache -modcache'
alias go-deps="go list -f '{{join .Deps \"\n\"}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"
alias go-bench='go test -benchmem -bench=.'
alias go-test='go test -count 1 -v .'

# git
alias gcd='cd $(git root)'
alias giff='git diff'

# kitty
alias kitty-up='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias ssh='kitty +kitten ssh'
alias kat='kitty +kitten icat'

# dotfiles
alias dots='git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias dots-store='dots commit -am "stored at: $(date --rfc-3339=seconds)" && dots push'
alias dots-plugs='vim-plugs-ls > ${HOME}/.vim/plugins-list'

# kubernetes
alias k='kubectl'
alias kns='k ns'
alias kctx='k ctx'
alias kpods='k get pods'
alias kapt='k krew'
alias kapt-up='kapt upgrade'

# nmap
alias nscan-base='nmap --source-port 53'
alias nscan-net='nscan-base -T1 -sn -PP -PM --scan-delay 0.5'
alias nscan-web='nscan-base -T3 -sS -Pn --open -O --osscan-guess --fuzzy -p 21-25,80,81,443,8080'
alias nscan-host='nscan-base -T3 -sS -Pn --open -sV --version-light -F --top-ports 200'
alias nscan-xray='nscan-base -T3 -sS -Pn --open -A'

# wifi
alias wifi-up="nmcli device wifi connect"
alias wifi-ls="nmcli device wifi list --rescan yes"

