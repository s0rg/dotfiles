if [ -d "${HOME}/.local/bin" ]; then
    PATH=${PATH}:${HOME}/.local/bin
fi

if [ -d "${HOME}/.local/scripts" ]; then
    PATH=${PATH}:${HOME}/.local/scripts
fi

if [ -d "${HOME}/.krew" ]; then
    PATH=${PATH}:${HOME}/.krew/bin
fi

export PATH=${PATH}:/snap/bin:${HOME}/Telegram
