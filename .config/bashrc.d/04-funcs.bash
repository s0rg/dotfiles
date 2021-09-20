## fs tools

# creates new directory and enters it
md() { mkdir -p "${@}" && cd "${@}" || exit; }

# cd up
up() { cd "$(printf "%0.s../" $(seq 1 "${1:-1}"))" || exit; }

# `opn` with no arguments opens the current directory,
# otherwise opens the given location or file
opn() { xdg-open "${@:-.}" > /dev/null 2>&1; }

# `lst` with no arguments shows 5 last-changed elements
# in current dir. You can specify count i.e.: `lst 10`
lst() {
    # shellcheck disable=2012
    \ls -1ct --color=always | head --lines "${1:-5}"
}


## shell utils

# eye-candy man
# see: https://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
# note: putting this directly in your env, will break env command output, so keeping them here.
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;38;5;74m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[46;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;38;5;146m' \
    man "${@}"
}

# basic math
calc() { printf "%s\n" "$*" | bc -l; }

# starts stopwatch with 1-second step
stopwatch() {
    local start
    local now
    echo -e "Started at $(date +%H:%M:%S), press ^C to stop\n"
    start=$(date -u +%s)
    while true; do
        now=$(date +%s)
        echo -ne "\r⌚ $(date -u --date=@$(("${now}" - "${start}")) +%H:%M:%S) "
        sleep 1
    done
}

# dumps ssl certificate info for given host
sslcerts() {
    if [ ${#} -eq 0 ]; then
        echo "need host"
        exit
    fi
    openssl s_client -connect "${1}":443 < /dev/null | openssl x509 -text
}


## vim

# Edit Script by Name
esn() {
    if [ ${#} -eq 0 ]; then
        echo "need script name"
        exit 1
    fi
    local src
    src="$(which "${1}")"
    if [ -z "${src}" ]; then
        echo "none found"
        exit 1
    fi
    ${EDITOR} "${src}"
}

# omg - Open Main.Go (or any other file with given name)
# 1. finds first existing file ('main.go' by default) or creates new one
# 2. opens it with EDITOR
omg() {
    local name
    local main
    name="${1:-main.go}"
    main="$(fd --type f --max-results=1 --color never --glob "${name}")"
    if [ -n "${main}" ]; then
        name="${main}"
    fi
    ${EDITOR} "${name}"
}


## git

# creates and switches to new feature branch
git-feature() {
    local branch
    if [ ${#} -eq 0 ]; then
        echo -n "feature name: "
        read -r branch
    else
        branch="${1}"
    fi
    git checkout -b "feature/${branch}"
}

# git fuzzy checkout
gfc() {
    local branch
    branch=$(git branches | fzf --preview 'git log -n 15 --oneline --abbrev-commit {} 2> /dev/null || echo "-- remote branch --"')
    if [ -n "${branch}" ]; then
        git checkout "${@}" "${branch}"
    fi
}

# git smart push, sets upstream if none yet
gip() {
    local branch
    local upstream
    branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null)"
    upstream="$(git rev-parse --abbrev-ref "${branch}"@\{upstream\} 2> /dev/null)"
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
