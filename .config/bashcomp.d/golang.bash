# https://github.com/posener/complete
complete -C /home/s0rg/projects/go/bin/gocomplete go

function _complete_go_home() {
    local d=("${GOSRC_ROOT}/${2}"*)
    [[ -e ${d[0]} ]] && COMPREPLY=( "${d[@]##*/}" )
}

