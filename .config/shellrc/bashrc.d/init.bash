# shell options: https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s cdspell
shopt -s checkjobs
shopt -s checkhash
shopt -s checkwinsize
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s globstar
shopt -s hostcomplete
shopt -s huponexit
shopt -s nocaseglob
shopt -s no_empty_cmd_completion

# append history file
shopt -s histappend
shopt -s histreedit

# save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
shopt -s lithist

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

for src in "${HOME}"/.config/shellrc/*.sh; do
    [ -r "${src}" ] && . "${src}"
done
unset src

export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="[ %h %d %H:%M:%S ]  "
export HISTFILE="${XDG_CACHE_HOME}/shell_history"
export HISTFILESIZE=5000

HISTIGNORE="${HISTIGNORE}:&: *:?:??"                                    # defaults + one and two-letters commands
HISTIGNORE="${HISTIGNORE}:* --help:* -h:* --version"                    # arguments to forget
HISTIGNORE="${HISTIGNORE}:[bf]g?( *):rm?( *):ls?( *):cd?( *):sudo?( *)" # nothing to remember here, move along
HISTIGNORE="${HISTIGNORE}:top:pstree:htop:ps?( *):killall?( *)"         # process management
HISTIGNORE="${HISTIGNORE}:history?( *):hsg?( *):hs-*"                   # history management
HISTIGNORE="${HISTIGNORE}:dots?( *):dots-*"                             # dot files
HISTIGNORE="${HISTIGNORE}:up?( *):lst?( *):cd[pdbls]:o?( *):md?( *)"    # fs tools
HISTIGNORE="${HISTIGNORE}:clear:pwd:env:reset:tree:cal"                 # other tools and aliases
HISTIGNORE="${HISTIGNORE}:lsx:dfx:gotop:wttr:path:ren-*:yt[dav]?( *)"   # ...
HISTIGNORE="${HISTIGNORE}:obey:si:ex?( *):sh-*:ll:bak?( *):z8[dj]"      # ...
HISTIGNORE="${HISTIGNORE}:*KEY*:*TOKEN*"                                # extras

export HISTIGNORE

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# custom
for src in "${XDG_CONFIG_HOME}"/shellrc/bashcomp.d/*.bash; do
    [ -r "${src}" ] && . "${src}"
done
unset src

# extra aliases
__git_complete g git
__git_complete dots git

complete -F __start_kubectl k
complete -F _docker_compose dcc
complete -F _complete_go_home cdgo
complete -F _complete-go-wrk-dir cdwrk
complete -F _complete_zathura zathura zat
