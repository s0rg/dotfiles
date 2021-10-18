# enable aliases to be sudo’ed
alias sudo='sudo '

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -hAlF --time-style=+"%Y-%m-%d %H:%M:%S"'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias dmesg='dmesg --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ncdu='ncdu --color dark'

# shorthands
alias v='vim'
alias t='touch'
alias wh='which'
alias mc='mc -d'
alias unx='7z x'
alias si='sudo -i'
alias zat='zathura'
alias mtr='mtr -bze'
alias chx='chmod u+x'
alias tailf='tail -f --retry'
alias obey='sudo $(fc -ln -1)'
alias today='date "+%Y_%m_%d"'
alias cal='echo; ncal -M -3; echo'

# more is less
alias more='less'

# extras
alias tree='exa --icons --group-directories-first --tree --level=2 --git-ignore'
alias lsx='exa --icons --group-directories-first --long --header --git --colour-scale --time-style=long-iso'
alias duf='duf --hide special'
alias hx='hexyl'
alias gr='rg'

# shell tools
alias sh-reload='exec "${SHELL}" -l'
alias sh-nohist='unset HISTFILE'
alias sh-funlist='compgen -A function | sort -u'
alias sh-path='echo -n "$PATH" | tr ":" "\n" | sort'

# shell extras
alias sh-timer='py-timer'
alias sh-colors='colortest-python --ansicodes'
alias sh-rot13='tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]"; echo'
alias sh-rot47='tr !-~ P-~!-O; echo'
alias sh-stats='sort | uniq -c | sort -n -r'
alias sh-trim='sed -e '\''s/^[[:space:]]*//g'\'' -e '\''s/[[:space:]]*\$//g'\'''
alias sh-size='_fn_size'
alias sh-strip-ansi="sed 's/\x1b\[[0-9;]*m//g'"
alias sh-lc-all='rename "y/A-Z/a-z/" *'
alias sh-uc-all='rename "y/a-z/A-Z/" *'

# list taken from: https://techblog.willshouse.com/2012/01/03/most-common-user-agents/
alias sh-rnd-ua='shuf -n 1 "${XDG_DATA_HOME}"/rand_ua.list'

# jq
alias jsp='jq -C .'
alias swag-urls="jq '.paths | keys | .[]'"

# curl
alias curl='curl --user-agent "$(sh-rnd-ua)"'
alias get='curl --silent --progress-bar -OL'
alias heads='curl -sI'
alias ifco='\curl ifconfig.co'
alias wttr='echo; \curl http://wttr.in/?format="%c:+%f+%w\n"; echo'

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
alias hstats='history | cut -d"]" -f 2- | sh-stats | head'

# fast travel
alias cdp='cd ~/projects'
alias cdd='cd ~/Documents'
alias cdb='cd ~/Documents/Books'
alias cdl='cd ~/Downloads && lst'
alias cds='cd ~/.local/scripts'

# fast open
alias omc='cd "${XDG_CONFIG_HOME}"; om 00-base.bash'

# system
alias top-mem='ps -Ao user,pid,pcpu,pmem,comm --sort=-pmem | head --lines=6'
alias top-cpu='ps -Ao user,pid,pcpu,pmem,comm --sort=-pcpu | head --lines=6'
alias inet-ports='netstat -nape --inet'

# python
alias py='python3'
alias bp='bpython'
alias pip-get='pip3 install --user --upgrade'
alias pip-up='pip3 freeze --user | cut -d= -f1 | xargs -n1 pip3 install --user --upgrade'
alias py-clear='find . | grep -E "(__pycache__|\.py[co]$)" | xargs rm -rf'

# youtube-dl
alias ytd='youtube-dl'
alias yta='youtube-dl -f bestaudio --extract-audio'
alias ytv='youtube-dl -f bestvideo+bestaudio'

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=normal "alert" "$(fc -nl -1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'' -e '\''s/^[[:space:]]*//'\'')"'

# docker
alias doi-up="docker images -f 'dangling=false' --format '{{.Repository}}:{{.Tag}}' | xargs -L1 docker pull"
alias doi-clr="docker images -f 'dangling=true' -q | xargs -L1 docker rmi"
alias dps='docker ps -a'
alias dcc='docker-compose'
alias dcu='docker-compose up --remove-orphans'
alias dcd='docker-compose down --remove-orphans'
alias dcb='docker-compose build --force-rm'
alias dcl='docker-compose logs -f'

# git
alias gcd='cd $(git root)'
alias gif='git diff'

# kitty
alias kitty-up='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias ssh='kitty +kitten ssh'
alias kat='kitty +kitten icat'

# dotfiles
alias dots='git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias dots-store='dots commit -am "stored at: $(date --rfc-3339=seconds)" && dots push'
alias dots-plugs='vim-plugs-ls > ${HOME}/.vim/plugins-list'

# zoom
alias z8j='zoom-join'

# kubernetes
alias k='kubectl'
alias kns='k ns'
alias kctx='k ctx'
alias kpods='k get pods'
alias kapt='k krew'
alias kapt-up='kapt upgrade'

# nmap
alias _nmp='proxychains nmap --source-port 53'
alias nscan-net='_nmp -T1 -sn -PP -PM --scan-delay 0.5'
alias nscan-web='_nmp -T3 -sS -Pn --open -O --osscan-guess --fuzzy -p 21-25,80,81,443,8080'
alias nscan-host='_nmp -T3 -sS -Pn --open -sV --version-light -F --top-ports 200'
alias nscan-xray='_nmp -T3 -sS -Pn --open -A'
unset _nmp

# wifi
alias wifi-up="nmcli device wifi connect"
alias wifi-ls="nmcli device wifi list --rescan yes"
