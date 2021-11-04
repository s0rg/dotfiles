dir_colors=$(vivid generate jellybeans)
export LS_COLORS="${dir_colors}"
unset dir_colors

source "${XDG_CACHE_HOME}"/zcolors
