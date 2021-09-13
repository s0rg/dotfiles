_kube_namespaces() {
  local cur;
  cur=${COMP_WORDS[COMP_CWORD]}
  #COMPREPLY=( $(compgen -W "- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}')" -- "$curr_arg" ) );
  mapfile -t COMPREPLY < \
        <(compgen -W "- $(kubectl get namespaces -o=jsonpath='{range .items[*].metadata.name}{@}{"\n"}{end}')" -- "$cur")
}

complete -F _kube_namespaces kubens kns
