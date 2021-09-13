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
    local n;
    n=5;
    if [ ${#} -eq 1 ]; then
        n="${1}";
    fi
    \ls -1ct --color=always | head --lines "${n}"
}

# starts stopwatch with 1-second step
stopwatch() {
    local start, now;
    echo -e "Started at $(date +%H:%M:%S), press ^C to stop\n";
    start=$(date -u +%s);
    while true; do
        now=$(date +%s);
        echo -ne "#=> $(date -u --date=@$(("${now}" - "${start}")) +%H:%M:%S)\r";
        sleep 1;
    done
}

# dumps ssl certificate info for given host
sslcerts() {
    if [ ${#} -eq 0 ]; then
        echo "specify https host!";
        exit;
    fi
    openssl s_client -connect "${1}":443 < /dev/null | openssl x509 -text
}

