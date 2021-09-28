GOVERSION='1.17'

export GO111MODULE=on
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

# aliases
alias go-clean='go clean -x -cache -testcache -modcache'
alias go-deps="go list -f '{{join .Deps \"\n\"}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"
alias go-bench='go test -benchmem -bench=.'
alias go-test='go test -count 1 -v .'
alias go-mod-init='go mod init; go mod tidy'
alias go-mod-up='go get -u ./...; go mod tidy'
