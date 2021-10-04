![WIP](https://img.shields.io/badge/status-wip-red)

# dotfiles

This repo is managed via [this](https://www.atlassian.com/git/tutorials/dotfiles) method

## software

- wm: [i3](https://i3wm.org/)
- editor: [vim](https://www.vim.org/)
- shell: [bash](https://www.gnu.org/software/bash/)
- menus: [rofi](https://github.com/davatorium/rofi)
- music: [cmus](https://cmus.github.io/)
- terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- panel: [polybar](https://polybar.github.io/)
- system info: [gotop](https://github.com/xxxserxxx/gotop)
- notifications: [dunst](https://dunst-project.org/)
- theme generation: [pywal](https://github.com/dylanaraps/pywal)
- media auto-mount: [udiskie](https://github.com/coldfix/udiskie)
- os: any debian-based linux distro

### look & feel

- icons: [Griffin-Ghost](https://store.kde.org/p/1227736/)
- fonts: [ubuntu mono nerd font](https://www.nerdfonts.com/)

### helpers

- http cli: [httpie](https://httpie.io/) + [http-prompt](https://github.com/httpie/http-prompt)
- sql client: [usql](https://github.com/xo/usql)
- code stats: [scc](https://github.com/boyter/scc)
- disk usage: [duf](https://github.com/muesli/duf)
- hex view: [hexyl](https://github.com/sharkdp/hexyl)
- fuzzy finder: [fzf](https://github.com/junegunn/fzf)
- faster `find`: [fd](https://github.com/sharkdp/fd)
- colored `cat`: [bat](https://github.com/sharkdp/bat)
- eye-saver: [redshift](https://github.com/jonls/redshift)
- eye-candy `ls`: [exa](https://the.exa.website/)
- faster `grep`: [ripgrep](https://github.com/BurntSushi/ripgrep)
- better `git-diff`: [delta](https://github.com/dandavison/delta)
- document viewer: [zathura](https://pwmt.org/projects/zathura/)
- markdown viewer: [glow](https://github.com/charmbracelet/glow)
- assembly compiler: [fasm](https://flatassembler.net)

## example screenshot
![screenshot](https://github.com/s0rg/dotfiles/blob/master/.config/i3/screenshot.png)

## usage
~~~ sh
git clone --recursive --separate-git-dir=$HOME/.dotfiles.git https://github.com/s0rg/dotfiles.git /tmp/dots
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
dotfiles submodule update --init --recursive $HOME/
~~~
