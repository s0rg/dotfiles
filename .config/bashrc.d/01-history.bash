# append history file
shopt -s histappend
shopt -s histreedit

# save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
shopt -s lithist

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

export HISTSIZE=500
export HISTFILESIZE=5000
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="[ %h %d %H:%M:%S ]  "
export HISTFILE="${XDG_CACHE_HOME}/shell_history"

HISTIGNORE="${HISTIGNORE}:&: *:?:??"                                    # defaults + one and two-letters commands
HISTIGNORE="${HISTIGNORE}:* --help:* -h:* --version"                    # arguments to forget
HISTIGNORE="${HISTIGNORE}:[bf]g?( *):rm?( *):ls?( *):cd?( *):sudo?( *)" # nothing to remember here, move along
HISTIGNORE="${HISTIGNORE}:top:pstree:htop:ps?( *):killall?( *)"         # process management
HISTIGNORE="${HISTIGNORE}:history?( *):hig?( *):hclear:hstats"          # history management
HISTIGNORE="${HISTIGNORE}:dots?( *):dots-*"                             # dot files
HISTIGNORE="${HISTIGNORE}:up?( *):lst?( *):cd[pdbls]:o?( *):md?( *)"    # fs tools
HISTIGNORE="${HISTIGNORE}:clear:pwd:env:reset:tree:cal"                 # other tools and aliases
HISTIGNORE="${HISTIGNORE}:lsx:dfx:gotop:wttr:path:ren-*:yt[dav]?( *)"   # ...
HISTIGNORE="${HISTIGNORE}:obey:si:ex?( *):sh-*:ll:bak?( *):z8[dj]"      # ...
HISTIGNORE="${HISTIGNORE}:*KEY*:*TOKEN*"                                # extras

export HISTIGNORE
