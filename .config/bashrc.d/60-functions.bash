# create a new directory and enter it
md() { mkdir -p "${@}" && cd "${@}" || exit; }

# `opn` with no arguments opens the current directory,
# otherwise opens the given location or file
opn() {
    if [ ${#} -eq 0 ]; then
        xdg-open . > /dev/null 2>&1
    else
        xdg-open "${@}" > /dev/null 2>&1
    fi
}

# `fresh` with no arguments shows 5 last-changed elements
# in current dir. You can specify count i.e.: `fresh 10`
fresh(){
    n=5
    if [ ${#} -eq 1 ]; then
        n="${1}"
    fi
    \ls -1ct --color=always | head --lines "${n}"
}

# eye-candy man
# see: https://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
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

# starts stopwatch with 1-second step
stopwatch() {
    echo -e "Started at $(date +%H:%M:%S), press ^C to stop\n";
    start=$(date -u +%s);
    while true; do
        now=$(date +%s);
        echo -ne "#=> $(date -u --date=@$(("${now}" - "${start}")) +%H:%M:%S)\r";
        sleep 1;
    done
}

