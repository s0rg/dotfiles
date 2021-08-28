![WIP](https://img.shields.io/badge/status-wip-red)

# dotfiles

My golang-centric dev environment for linux.
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

- http cli: [httpie](https://httpie.io/)
- sql client: [usql](https://github.com/xo/usql)
- disk usage: [duf](https://github.com/muesli/duf)
- fuzzy finder: [fzf](https://github.com/junegunn/fzf)
- colored `cat`: [bat](https://github.com/sharkdp/bat)
- eye-candy `ls`: [exa](https://the.exa.website/)
- faster `grep`: [ripgrep](https://github.com/BurntSushi/ripgrep)
- better `git-diff`: [delta](https://github.com/dandavison/delta)
- markdown viewer: [glow](https://github.com/charmbracelet/glow)

## example screenshot
![screenshot](https://github.com/s0rg/dotfiles/blob/master/.config/i3/screenshot.png)

## usage
~~~ sh
git clone --recursive --separate-git-dir=$HOME/.dotfiles.git https://github.com/s0rg/dotfiles.git /tmp/dots
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
dotfiles submodule update --init --recursive $HOME/
~~~
