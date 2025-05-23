![WIP](https://img.shields.io/badge/status-wip-red)

# dotfiles

This repo is managed via [this](https://www.atlassian.com/git/tutorials/dotfiles) method

## screenshot

![screenshot](https://github.com/s0rg/dotfiles/blob/master/.config/i3/screenshot.png)

## software

- wm: [i3](https://i3wm.org/)
- shell: [zsh](https://www.zsh.org/) (*plugins* managed by [antidote](https://getantidote.github.io/)):
  - Notify on long (or failed) tasks: [MichaelAquilina/zsh-auto-notify](https://github.com/MichaelAquilina/zsh-auto-notify)
  - Kubernetes autocomplete + aliases: [Dbz/kube-aliases](https://github.com/Dbz/kube-aliases)
  - FZF for anything: [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab)
  - ...and history: [joshskidmore/zsh-fzf-history-search](https://github.com/joshskidmore/zsh-fzf-history-search)
  - ...and Git: [wfxr/forgit](https://github.com/wfxr/forgit)
  - fishy things: [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - eye-candy cli: [zdharma-continuum/fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
  - handy cli calc: [arzzen/calc.plugin.zsh](https://github.com/arzzen/calc.plugin.zsh)
  - docker (and docker compose) completions: [greymd/docker-zsh-completion](https://github.com/greymd/docker-zsh-completion)
- editor: [vim](https://www.vim.org/) (*plugins* managed by [pathogen](https://github.com/tpope/vim-pathogen)):
  - Async linters/fixers: [dense-analysis/ale](https://github.com/dense-analysis/ale)
  - Async autocomplete: [prabirshrestha/asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim) + [prabirshrestha/asyncomplete-lsp.vim](https://github.com/prabirshrestha/asyncomplete-lsp.vim) + [prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)
  - `.editorconfig` support: [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
  - FZF: [junegunn/fzf](https://github.com/junegunn/fzf.vim)
  - Best theme ever: [nanotech/jellybeans](https://github.com/nanotech/jellybeans.vim)
  - Status line: [itchyny/lightline](https://github.com/itchyny/lightline.vim)
  - Git branch for `lightline`: [itchyny/vim-gitbranch](https://github.com/itchyny/vim-gitbranch)
  - File browser: [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
  - Tag bar: [preservim/tagbar](https://github.com/preservim/tagbar)
  - Split/Join lines of code: [AndrewRadev/splitjoin](https://github.com/AndrewRadev/splitjoin.vim)
  - Comment all the things: [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
  - Colored colors: [ap/vim-css-color](https://github.com/ap/vim-css-color)
  - File icons: [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
  - Handy file open with file.name:{line}:{col}: [wsdjeg/vim-fetch](https://github.com/wsdjeg/vim-fetch)
  - Best golang dev toolkit: [fatih/vim-go](https://github.com/fatih/vim-go)
  - Less annoiyng quickfix/location lists: [romainl/vim-qf](https://github.com/romainl/vim-qf)
  - Handy startscreen: [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
- menus: [rofi](https://github.com/davatorium/rofi)
- music: [mpd](https://www.musicpd.org/)
- terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- panel: [polybar](https://polybar.github.io/)
- notifications: [dunst](https://dunst-project.org/)
- theme generation:
  - GUI: [pywal](https://github.com/dylanaraps/pywal)
  - CLI: [vivid](https://github.com/sharkdp/vivid)
- media auto-mount: [udiskie](https://github.com/coldfix/udiskie)
- os: any debian-based linux distro

### look & feel

- icons: [Griffin-Ghost](https://store.kde.org/p/1227736/)
- fonts: [ubuntu mono nerd font](https://www.nerdfonts.com/)

### helpers

- http cli: [xh](https://github.com/ducaale/xh)
- sql client: [usql](https://github.com/xo/usql)
- code stats: [scc](https://github.com/boyter/scc)
- disk usage: [duf](https://github.com/muesli/duf)
- hex view: [hexyl](https://github.com/sharkdp/hexyl)
- fuzzy finder: [fzf](https://github.com/junegunn/fzf)
- faster `find`: [fd](https://github.com/sharkdp/fd)
- colored `cat`: [bat](https://github.com/sharkdp/bat)
- eye-saver: [redshift](https://github.com/jonls/redshift)
- faster `grep`: [ripgrep](https://github.com/BurntSushi/ripgrep)
- better `git-diff`: [delta](https://github.com/dandavison/delta)
- markdown viewer: [glow](https://github.com/charmbracelet/glow)
- assembly compiler: [fasm](https://flatassembler.net)
- document viewer: [zathura](https://pwmt.org/projects/zathura/)

## usage

```sh
git clone --recursive --separate-git-dir=$HOME/.dotfiles https://github.com/s0rg/dotfiles /tmp/dots
rsync -rvl --exclude ".git" /tmp/dots/ $HOME/
rm -r /tmp/dots
dotfiles submodule update --init --recursive $HOME/
```
