GOVERSION='1.17'

export GOSUMDB=off
export GOROOT=/usr/local/go${GOVERSION}
export GOPATH=${HOME}/projects/go

export PATH=${PATH}:/usr/local/go${GOVERSION}/bin:${GOPATH}/bin

GOSRC_ROOT="${GOPATH}/src/github.com/${USER}"

cdgo() {
    if [ ! $# -eq 1 ]; then
        cd "${GOSRC_ROOT}" || return
    else
        cd "${GOSRC_ROOT}/${1}" || return
    fi
}

