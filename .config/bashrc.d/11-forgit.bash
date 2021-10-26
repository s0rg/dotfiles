# integration for https://github.com/wfxr/forgit
FORGIT_DIR="${HOME}"/.local/forgit

if [ -d "${FORGIT_DIR}" ]; then
    export FORGIT_NO_ALIASES="1"
    export PATH=${PATH}:"${FORGIT_DIR}"/bin
    source "${FORGIT_DIR}"/forgit.plugin.sh

    alias gco='git forgit checkout_commit'
    alias gcb='git forgit checkout_branch'
fi
