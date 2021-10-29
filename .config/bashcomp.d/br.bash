_br() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            br)
                cmd="br"
                ;;
            
            *)
                ;;
        esac
    done

    case "${cmd}" in
        br)
            opts=" -d -D -f -F -g -G -h -H -i -I -p -P -s -S -w -t -T -V -c -o  --dates --no-dates --only-folders --no-only-folders --show-root-fs --show-git-info --no-show-git-info --git-status --hidden --no-hidden --show-gitignored --no-show-gitignored --permissions --no-permissions --sizes --no-sizes --sort-by-count --sort-by-date --sort-by-size --whale-spotting --no-sort --trim-root --no-trim-root --install --get-root --help --version --outcmd --cmd --color --conf --height --out --set-install-state --print-shell-function --listen --send  <ROOT> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                
                --outcmd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cmd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "yes no auto" -- "${cur}"))
                    return 0
                    ;;
                --conf)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --height)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --set-install-state)
                    COMPREPLY=($(compgen -W "undefined refused installed" -- "${cur}"))
                    return 0
                    ;;
                --print-shell-function)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --listen)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --send)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        
    esac
}

complete -F _br -o bashdefault -o default br
