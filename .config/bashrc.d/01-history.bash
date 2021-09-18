# append history file
shopt -s histappend

# save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
shopt -s lithist

# common history for all sessions
export SHELL_SESSION_HISTORY=0

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

export HISTSIZE=5000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&: *:?:??:\
[bf]g?( *):up?( *):rm?( *):ls?( *):\
history?( *):hig?( *):sudo?( *):\
si:clear:pwd:env:path:reset:cd[pdbls]:\
*KEY*:*TOKEN*"
export HISTTIMEFORMAT="[ %h %d %H:%M:%S ]  "
