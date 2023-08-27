# enable aliases to be sudo’ed
alias sudo='sudo '

alias ls='ls --color=always --group-directories-first -v'
alias ll='ls -hAlFG --time-style=+"%Y-%m-%d %H:%M:%S"'
alias tt='tree --dirsfirst -I vendor/'
alias ls-last='_last_changed'

alias ip='ip -color=auto'
alias dir='dir --color'
alias vdir='vdir --color'
alias diff='diff --color=auto'
alias dmesg='dmesg --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# make them verbose and interacive by default
alias cp='cp -riv'
alias ln='ln -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'

# ripgrep
alias rg='rg --color always'
alias rgf='rg --color always --no-heading'

# shortcuts
alias t='touch'
alias v='vim'
alias si='sudo -i'
alias chx='chmod u+x'
alias duf='duf --hide special'
alias hx='hexyl'
alias unx='7z x'
alias zat='zathura'
alias cal='echo; ncal -M -3; echo'
alias obey='sudo !!'
alias mc='mc -d'
alias mtr='mtr -bze'
alias more='less'
alias tailf='tail -f --retry'
alias today='date "+%Y_%m_%d"'
alias iso-date='date -u +%FT%H:%M:%S'

# shell tools
alias sh-nohist='unset HISTFILE'
alias sh-path='echo -n "$PATH" | tr ":" "\n" | sort'

# shell extras
alias sh-timer='py-timer'
alias sh-rot13='tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"; echo'
alias sh-rot47='tr !-~ P-~!-O; echo'
alias sh-stats='sort | uniq -c | sort -n -r'
alias sh-trim='sed -e '\''s/^[[:space:]]*//g'\'' -e '\''s/[[:space:]]*\$//g'\'''
alias sh-size='_fn_size'
alias sh-strip-ansi="sed 's/\x1b\[[0-9;]*m//g'"
alias sh-fetch='clear; neofetch --backend "kitty"; echo ;'
alias sh-tolower='rename "y/A-Z/a-z/" *'
alias sh-toupper='rename "y/a-z/A-Z/" *'

# list taken from: https://techblog.willshouse.com/2012/01/03/most-common-user-agents/
alias sh-rnd-ua='shuf -n 1 "${XDG_DATA_HOME}"/rand_ua.list'

alias jsp='jq --color . <'
alias swag-urls="jq '.paths | keys | .[]'"

# curl
alias curl='curl --user-agent "$(sh-rnd-ua)"'
alias get='curl --progress-bar -OL'
alias headers='curl -sI'

alias ifco='\curl ifconfig.co'
alias wttr='echo; \curl http://wttr.in/?format="%c:+%f+%w\n"; echo'

# clipboard
alias clip-get='xclip -selection clipboard -out'
alias clip-put='xclip -selection clipboard -in'
alias clip-clr='echo -n "" | clip-put'
alias pub2clip='cat ${HOME}/.ssh/id_rsa.pub | clip-put'

# fast travel
alias cdl='cd ~/Downloads && ls-last'
alias cds='cd ~/.local/scripts'
alias cdt='cd $(mktemp -d)'

# fast open for configs
alias omc='cdc; om 00-shell.sh'

# system
alias inet-ports='netstat -nape --inet'

# python
alias py='python3'
alias pip-get='pip3 install --user --upgrade'
alias pip-up='pip3 freeze --user | cut -d= -f1 | xargs -n1 pip3 install --user --upgrade'
alias py-clear='find . | grep -E "(__pycache__|\.py[co]$)" | xargs rm -rf'

# docker
alias d-img-up="docker images -f 'dangling=false' --format '{{.Repository}}:{{.Tag}}' | xargs -L1 docker pull"
alias d-img-clr="docker images -f 'dangling=true' -q | xargs -L1 docker rmi"
alias d-prune="docker system prune -f"
alias dop='docker stats'
alias dps='docker ps -a'
alias dcc='docker compose'
alias dcd='dcc down'
alias dcb='dcc build --force-rm'
alias dcl='dcc logs -f'

# kitty
alias kitty-up='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias ssh='kitty +kitten ssh'
alias kat='kitty +kitten icat'

# dotfiles
alias dots='git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias dots-push='dots commit -am "stored at: $(date --rfc-3339=seconds)" && dots push'
alias dots-plugs='vim-plugs-ls > ${HOME}/.vim/plugins-list'

# zoom
alias z8j='zoom-join'

# kubernetes
alias kns='k ns'
alias kctx='k ctx'
alias kapt='k krew'
alias kapt-up='kapt upgrade'
alias knode='kubecolor describe node'
alias klogs='kubecolor logs -f'
alias klogs-all='kubecolor logs -f --all-containers'
alias kevents='kubecolor get events --sort-by=.metadata.creationTimestamp'

# nmap
alias _nmp='nmap --source-port 53'
alias nscan-net='_nmp -T1 -sn -PP -PM --scan-delay 0.5'
alias nscan-web='_nmp -T3 -sS -Pn --open -O --osscan-guess --fuzzy -p 21-25,80,81,443,8080'
alias nscan-host='_nmp -T3 -sS -Pn --open -sV --version-light -F --top-ports 200'
alias nscan-xray='_nmp -T3 -sS -Pn --open -A'
unset _nmp

# socks5 via tor
alias torsocks='docker run -p 127.0.0.1:9150:9150 stefanoj3/tordock'

# wifi
alias wifi-ls='nmcli device wifi list --rescan yes'

# wireplumber
alias rewire='systemctl --user restart wireplumber'

# scc
alias scc='scc --wide --exclude-dir vendor'
alias scc-gocode='scc --generated-markers "DO NOT EDIT" --no-gen --include-ext go --not-match "_test\.go$"'

# deb packages
alias ipkg='sudo dpkg -i'

# https://github.com/rikhuijzer/ata as chatGPT cli
alias gpt='ata --config=/home/s0rg/.config/ata/ata.toml'

# global aliases
alias -g NE='2>|/dev/null'
alias -g NO='&>|/dev/null'
alias -g EO='>|/dev/null'

alias -g G='| rg '
alias -g P='| $PAGER'
alias -g PA='2>&1 | $PAGER'
alias -g L='| wc -l'

alias shup='sh-plugs-up; vim-plugs-up; echo "Tools:"; gup update; echo "Arduino:"; arduino-cli upgrade'

alias structurizr='docker run -it --rm -p 127.0.0.1:30303:8080 -v .:/usr/local/structurizr structurizr/lite'
