# append history file
shopt -s histappend

# save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
shopt -s lithist

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

export HISTSIZE=5000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="[ %h %d %H:%M:%S ]  "

HISTIGNORE="${HISTIGNORE}:&: *:?:??"                                    # defaults + one and two-letters commands
HISTIGNORE="${HISTIGNORE}:[bf]g?( *):rm?( *):ls?( *):cd?( *):sudo?( *)" # nothing to remember here, move along
HISTIGNORE="${HISTIGNORE}:clear:pwd:env:reset:tree:top:cal:pstree:htop" # tools and aliases
HISTIGNORE="${HISTIGNORE}:up?( *):lst?( *):cd[pdbls]:opn?( *):md?( *)"  #
HISTIGNORE="${HISTIGNORE}:lsx:dfx:gotop:wttr:path:ren-*"                #
HISTIGNORE="${HISTIGNORE}:history?( *):hig?( *):hclear:hstats"          # history management
HISTIGNORE="${HISTIGNORE}:dots?( *):dots-*"                             # dot files
HISTIGNORE="${HISTIGNORE}:*KEY*:*TOKEN*"                                # extras

export HISTIGNORE
