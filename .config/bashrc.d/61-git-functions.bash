# creates and switches to new feature branch
git-feature() {
    if [ ${#} -eq 0 ]; then
        echo -n "feature name: "
        read -r branch
    else
        branch="feature/${1}"
    fi
    git checkout -b "${branch}"
}

# git + fzf branch helper
git-branch() {
    branch=$(git for-each-ref --format='%(refname:short)' refs/heads/* |\
        fzf --prompt="branch: " --reverse)
    if [ -n "${branch}" ]; then
        git switch "${branch}"
    fi
}

# git smart push, sets upstream if none yet
gip() {
    branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null)"
    upstream="$(git rev-parse --abbrev-ref "${branch}"@\{upstream\} 2> /dev/null)"
    if [ -z "${upstream}" ]; then
      git push --set-upstream origin "${branch}"
    else
      git push
    fi
}

# acts as a git shortcut, without options - runs 'git status'
g() {
    if [ -z "${1}" ]; then
        git status --short --branch
    else
        git "${@}"
    fi
}
