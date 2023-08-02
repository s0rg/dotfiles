## fs tools

# show N (5 by deafult) last-changed elements in cwd
_last_changed() {
	find . -maxdepth 1 -type f -printf '%T+ %f\n' | sort -r | head --lines "${1:-5}"
}

# determine size of a file or total size of a directory
_fn_size() { du -sbh -- "${@:-.}"; }

# create new directory (if it does not exists) and cd into it
mcd() {
	[ -z "${1}" ] && return
	[ ! -e "${1}" ] && mkdir -p "${1}"
	cd "${1}" || return
}

# `opn` with no arguments open current directory,
# otherwise open the given location or file
opn() { xdg-open "${@:-.}" disown >/dev/null 2>&1; }

# open url in firefox tab
firetab() { firefox --new-tab --url "${1}"; }

export BROWSER='firetab'

# (un-)backups file or dir
bak() {
	local t
	t="${1}"

	if [ -z "$t" ]; then
		echo "need argument"
		return
	fi

	if [[ "${t:0-1}" = "/" ]]; then
		t="${t%%/}"
	fi

	if [[ "${t:0-4}" = ".bak" ]]; then
		mv -v -i "$t" "${t%%.bak}"
	else
		cp -v -i -r "$t"{,.bak}
	fi
}

## shell utils

# dump ssl certificate info
sslcerts() {
	if [ ${#} -eq 0 ]; then
		echo "need host"
		return 1
	fi
	openssl s_client -connect "${1}":443 </dev/null | openssl x509 -text
}

# show network timings for host
net_timings() {
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

# show the public IP via opendns.
ip_wan() {
	local CMD
	CMD="dig +short +timeout=1 +retry=1 myip.opendns.com @resolver1.opendns.com"
	local IP4
	IP4="$(${CMD} -4 A | grep -v '^;;')"
	local IP6
	IP6="$(${CMD} -6 AAAA | grep -v '^;;')"

	[ -n "${IP4}" ] && echo "IPv4: ${IP4}"
	[ -n "${IP6}" ] && echo "IPv6: ${IP6}"
}

# serve directory by http
serve() {
	local PORT
	PORT="${1:-8090}"
	ip_lan
	python3 -m http.server "${PORT}"
}

## vim

# om - Open Main.go (or any other file with given name)
# 1. finds existing file ('main.go' by default) or creates new one in cwd
# 2. opens it with $EDITOR
om() {
	local name
	local main
	name="${1:-main.go}"
	main="$(fd --type f --color never --glob "${name}" | fzf -1)"
	[ -n "${main}" ] && name="${main}"
	${EDITOR} "${name}"
}

## kubernetes

# show all pods or describe given
kpods() {
	if [ -z "${1}" ]; then
		kubecolor get pods -o wide
	else
		kubecolor describe pod "${@}"
	fi
}

## docker

# executes `usql` for given docker container with postgres
dsql() {
	local container
	container="${1:-postgres_container}"
	local db
	db="${2:-postgres}"
	local user
	user="${POSTGRES_USER:-postgres}"
	local pass
	pass="${POSTGRES_PASSWORD:-postgres}"
	local port
	port="${POSTGRES_PORT:-5432}"
	local addr
	addr=$(docker-ip --raw "${container}")
	usql "postgresql://${user}:${pass}@${addr}:${port}/${db}?sslmode=disable"
}

# executes `docker compose up` for given files
dcu() {
	local files
	files="-f docker-compose.yml"
	for var in "$@"; do
		files="$files -f $var"
	done
	eval "docker compose ${files} up"
}
