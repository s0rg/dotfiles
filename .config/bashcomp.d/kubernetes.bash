_kube_contexts() {
    local cur;
    cur=${COMP_WORDS[COMP_CWORD]}
    mapfile -t COMPREPLY < \
        <(compgen -W "- $(kubectl config get-contexts --output='name')" -- "$cur")
}

_kube_namespaces() {
  local cur;
  cur=${COMP_WORDS[COMP_CWORD]}
  mapfile -t COMPREPLY < \
        <(compgen -W "- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}')" -- "$cur")
}

source <(kubectl completion bash)
complete -F _kube_contexts kubectx kctx
complete -F _kube_namespaces kubens kns

