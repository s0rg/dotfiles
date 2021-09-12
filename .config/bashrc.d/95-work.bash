export GOPRIVATE='*.dev.cloud.mts.ru'
export GOPROXY="nexus.dev.cloud.mts.ru/repository/golang-internal,direct"
export GONOSUMDB=git.dev.cloud.mts.ru

ZOOM_DAILY_URL="https://us04web.zoom.us/j/76677926533?pwd=K21VTXl3anp3Q09IQVRrMmFLcXdqQT09"

alias k-dev-auth="k oidc-login get-token \
                 --oidc-issuer-url=https://keycloak.dev.cloud.mts.ru/auth/realms/kube-develop \
                 --oidc-client-id=kubernetes-develop \
                 --oidc-client-secret=bee18c53-f6c5-4158-8ae3-2c012f2ff4b7 \
                 --browser-command qutebrowser"

alias z8m='zoom-join "$ZOOM_DAILY_URL"'

GOWRK_ROOT="$GOPATH/src/git.dev.cloud.mts.ru/backoffice"

cdwrk() {
    if [ ! $# -eq 1 ]; then
        cd "$GOWRK_ROOT" || return
    else
        cd "$GOWRK_ROOT/$1" || return
    fi
}

function _complete-go-wrk-dir() {
    local d=("$GOWRK_ROOT/$2"*)
    [[ -e ${d[0]} ]] && COMPREPLY=( "${d[@]##*/}" )
}

complete -F _complete-go-wrk-dir cdwrk

