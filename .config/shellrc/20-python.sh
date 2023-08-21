LOCAL_VENV=~/.local/share/local-venv

export VIRTUAL_ENV_DISABLE_PROMPT=1

[ -e "$LOCAL_VENV" ] && . "${LOCAL_VENV}/bin/activate"
