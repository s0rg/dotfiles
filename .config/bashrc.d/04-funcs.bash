## fs tools

# create new directory (if it does not exists) and enter it
md() {
    [ -z "${1}" ] && return
    [ ! -e "${1}" ] && mkdir -p "${1}"
    cd "${1}" || return
}

# cd up
up() {
    cd "$(printf "%0.s../" $(seq 1 "${1:-1}"))" || return
    echo -e "\033[0;30m$(pwd)\033[0m\n"
}

# `o` with no arguments open current directory,
# otherwise open the given location or file
o() { xdg-open "${@:-.}" >/dev/null 2>&1; }

# `lst` with no arguments show 5 last-changed elements
# in current dir. You can specify count i.e.: `lst 10`
lst() {
    # shellcheck disable=2012
    \ls -1ct --color=always | head --lines "${1:-5}"
}

# backup copy of file or dir
bak() { [ -n "${1}" ] && cp -r "${1}" "${1}.bak"; }

# determine size of a file or total size of a directory
fs_size() { du -sbh -- "${@:-.}"; }

## shell utils

# eye-candy man
# see: https://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
# note: putting this directly in your env, will break env command output, so keeping them here
man() {
    env \
        LESS_TERMCAP_mb=$'\e[01;36m' \
        LESS_TERMCAP_md=$'\e[01;32m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[01;40;1m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;33m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        man "${@}"
}

# basic math
calc() {
    local result
    result="$(printf 'scale=4;%s\n' "${*}" | bc --mathlib | tr -d '\\\n')"
    if [[ "$result" == *.* ]]; then
        result=$(echo -n "${result}" | sed -e 's/^\./0./' -e 's/^-\./-0./' -e 's/0*$//;s/\.$//')
    fi
    echo "${result}"
}

# timer with 1-second step
fancy_timer() {
    local start
    local now
    start=$(date -u +%s)
    echo -e "Started at \e[34m$(date --date=@$(("${start}")) +%H:%M:%S)\e[0m, press ^C to stop\n"
    while true; do
        now=$(date +%s)
        echo -ne "\r⌚ \e[32m$(date -u --date=@$(("${now}" - "${start}")) +%H:%M:%S)\e[0m "
        sleep 1
    done
}

# dump ssl certificate info
sslcerts() {
    if [ ${#} -eq 0 ]; then
        echo "need host"
        return 1
    fi
    openssl s_client -connect "${1}":443 </dev/null | openssl x509 -text
}

# show network timings for host
net-test() {
    local addr
    addr="${1:-google.com}"
    local tmpl="\
resolve:           %{time_namelookup}s as %{remote_ip}\n\
handshake:         %{time_appconnect}s\n\
connect:           %{time_connect}s\n\
pre-transfer:      %{time_pretransfer}s\n\
redirect:          %{time_redirect}s\n\
start-transfer:    %{time_starttransfer}s\n\
--\n
total:             %{time_total}s\n\n"
    echo -e "\nstats for:         \e[32m${addr}\e[0m"
    curl --silent -o /dev/null -w "${tmpl}" "${addr}"
}

## vim

# om - Open Main.go (or any other file with given name)
# 1. finds first existing file ('main.go' by default) or creates new one in cwd
# 2. opens it with $EDITOR
om() {
    local name
    local main
    name="${1:-main.go}"
    main="$(fd --type f --max-results=1 --color never --glob "${name}")"
    [ -n "${main}" ] && name="${main}"
    ${EDITOR} "${name}"
}

## git

# fuzzy checkout
gfc() {
    local branch
    branch=$(git branches | fzf --preview 'git log -n 15 --oneline --abbrev-commit {} 2> /dev/null || echo "# remote branch #"')
    [ -n "${branch}" ] && git checkout "${@}" "${branch}"
}

# smart push, sets upstream if none yet
gip() {
    local branch
    local upstream
    branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null)"
    upstream="$(git rev-parse --abbrev-ref "${branch}"@\{upstream\} 2>/dev/null)"
    if [ -z "${upstream}" ]; then
        git push --set-upstream origin "${branch}"
    else
        git push
    fi
}

# acts as a git shortcut, without options - runs 'git status'
g() {
    if [ -z "${1}" ]; then
        git status --short --branch
    else
        git "${@}"
    fi
}

## docker

# executes usql for given postgres container
dcql() {
    local container
    container="${1:-postgres_container}"
    usql "postgresql://postgres:postgres@$(docker-ip --raw "${container}"):5432/postgres?sslmode=disable"
}
