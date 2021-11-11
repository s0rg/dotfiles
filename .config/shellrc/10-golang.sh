GOVERSION='1.17'

export GO111MODULE=on
export GOSUMDB=off
export GOROOT=/usr/local/go${GOVERSION}
export GOPATH=${HOME}/projects/go

export PATH=${PATH}:/usr/local/go${GOVERSION}/bin:${GOPATH}/bin

cd_aliases+=([cdgo]="${GOPATH}/src/github.com/${USER}")

_go_cpu_profile() {
    local t
    t="${1:-1}"s

    echo -e "[+] benchmarking for ${t}...\n"
    rm -f cpu.profile cpu_profile.pdf
    go test -benchtime "${t}" -cpuprofile cpu.profile -bench=. || return

    echo -e "\n[+] exporting pdf..."
    go tool pprof -pdf cpu.profile >cpu_profile.pdf || return

    echo "[+] starting ${PDF}..."
    ${PDF} cpu_profile.pdf

    t="$(basename "$(pwd)").test"
    [ -f "${t}" ] && rm -f "${t}"
}

# extract stacktrace from logger raw json
go-get-trace() {
    local trace
    trace=$(jq '.stacktrace' "$@" | sed -e 's/\"$//' -e 's/^\"//')
    if [ -n "${trace}" ]; then
        echo -e "${trace}"
    fi
}

# aliases
alias go-bench='go test -benchmem -bench=./...'
alias go-clean='go clean -cache -testcache -modcache; golangci-lint cache clean'
alias go-cpu='_go_cpu_profile'
alias go-noproxy='export GOPROXY="direct"'
alias go-mod-init='go mod init; go mod tidy'
alias go-mod-up='go get -u ./...; go mod tidy'
alias go-mod-ls="go list -f '{{join .Deps \"\n\"}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"

# https://github.com/kyoh86/richgo
alias go-test='richgo test -count 1 -v ./...'
