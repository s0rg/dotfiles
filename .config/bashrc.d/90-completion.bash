source <(kitty + complete setup bash)
source <(kubectl completion bash)

for s in "$HOME"/.config/bashcomp.d/*.bash; do
    [ -r "$s" ] && . "$s"
done

__git_complete g git
__git_complete dots git
complete -F __start_kubectl k
complete -F _complete-go-dir cdgo
