# common history for all sessions
export SHELL_SESSION_HISTORY=0

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export HISTSIZE=9000
export HISTFILESIZE=9000
export HISTCONTROL=ignoreboth:erasedups

export HISTIGNORE="&:[bf]g:clear:history:q:* --help:sudo *:si: *:ls:cd:cd -:pwd:exit:date:mc:ru-tran *:yta *:ytv *"

