# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if running bash
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

