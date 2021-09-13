_kube_contexts() {
    local cur;
    cur=${COMP_WORDS[COMP_CWORD]}
    mapfile -t COMPREPLY < \
        <(compgen -W "- $(kubectl config get-contexts --output='name')" -- "$cur")
}

complete -F _kube_contexts kubectx kctx
