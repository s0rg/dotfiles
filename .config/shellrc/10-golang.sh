GOVERSION='1.21'

export GOSUMDB=off
export GO111MODULE=on
export GOROOT="/usr/local/go${GOVERSION}"
export GOPATH="${HOME}/projects/go"

export PATH="${PATH}:/usr/local/go${GOVERSION}/bin:${GOPATH}/bin"

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
_go_get_trace() {
	local trace
	trace=$(dasel -r json '.stacktrace' "$@" | sed -e 's/\"$//' -e 's/^\"//')
	if [ -n "${trace}" ]; then
		echo -e "${trace}" | bat
	fi
}

# go mod operations
gmo() {
	if [ ! -f go.mod ]; then
		echo "[*] init"
		go mod init
		go mod tidy
	fi

	case $1 in
	ls)
		go list -f '{{join .Deps "\n"}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'
		return
		;;
	vendor)
		go mod vendor
		return
		;;
	up)
		go get -u ./...
		;;
	esac

	go mod edit -go="$(goversion)"
	go mod tidy

	if [ -d vendor ]; then
		echo "[*] vendors"
		go mod vendor
	fi
}

# aliases
alias go-bench='go test -benchmem -bench=./...'
alias go-test='gotest -count 1 -v ./...'

alias go-clean='go clean -cache -testcache -modcache; golangci-lint cache clean'

alias go-trace='_go_get_trace'
alias go-cpu='_go_cpu_profile'

alias go-noproxy='export GOPROXY="direct"'

alias -g GOF='2>&1 | rg "FAIL"'
