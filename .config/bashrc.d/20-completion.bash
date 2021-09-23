# base
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# custom
for src in "${XDG_CONFIG_HOME}"/bashcomp.d/*.bash; do
    [ -r "${src}" ] && . "${src}"
done
unset src

# extra aliases
__git_complete g git
__git_complete dots git

complete -F __start_kubectl k
complete -F _docker_compose dcc
complete -F _complete_go_home cdgo
complete -F _complete_zathura zathura zat

