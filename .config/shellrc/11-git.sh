export PATH="/home/s0rg/.cache/antidote/wfxr/forgit/bin:$PATH"

alias gco='git forgit checkout_commit'
alias gcb='git forgit checkout_branch'
alias glo='git forgit log'

alias gcd='cd $(git root)'

_git_default_branch() {
	echo -n "$(git branch | grep -o -m1 "\b\(master\|main\)\b")"
	# echo -n "$(git symbolic-ref --quiet --short HEAD 2>/dev/null || echo -n 'master')"
}

# acts as a git shortcut, without options - runs 'git status'
g() {
	if [ -z "${1}" ]; then
		git status --short --branch
	else
		git "${@}"
	fi
}

# checkout and pull default branch
gcm() {
	cd "$(git root)" || return
	git checkout "$(_git_default_branch)" || return
	git pull
	git prune
}

# smart push, sets upstream if none yet
gip() {
	local branch
	local upstream
	branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null)"
	upstream="$(git rev-parse --abbrev-ref "${branch}"@\{upstream\} 2>/dev/null)"
	if [ -z "${upstream}" ]; then
		git push --set-upstream origin "${branch}"
	else
		git push
	fi
}
