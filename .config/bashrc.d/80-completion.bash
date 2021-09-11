source <(kitty + complete setup bash)
source <(kubectl completion bash)

for s in "$HOME"/.config/bashcomp.d/*.bash; do
    [ -r "$s" ] && . "$s"
done

