set nocompatible
filetype plugin indent off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

syntax on
syntax sync fromstart

if (has("termguicolors"))
    set termguicolors
    set t_Co=256
endif

colorscheme jellybeans

let &t_ut=''

set encoding=utf8 fileencoding=utf-8 termencoding=utf-8 nobomb

set hidden
set autoread
set history=100
set autoindent

set wildmenu wildignore+=*.o,*~,*.pyo,*.pyc,*/.git/*

set shiftwidth=4
set expandtab smarttab tabstop=4 softtabstop=0

set switchbuf=usetab,newtab
set showmatch matchtime=10

set mousehide
set cursorline
set number
set numberwidth=3
set scrolloff=3
set backspace=indent,eol,start

set wrap
set whichwrap+=<,>,[,]
set textwidth=140

set linebreak
set cindent
set nostartofline

set nospell
set nobackup nowb noswapfile
set noerrorbells novisualbell
set t_vb=
set tm=500

set lazyredraw ttyfast redrawtime=15000
set hlsearch incsearch ignorecase smartcase

set title titlestring=vim:\ %f

set foldmethod=syntax foldnestmax=3
set nofoldenable

set completeopt=longest,menuone
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set splitbelow splitright

set termwinsize=6x0

set pastetoggle=<F2>

set noshowmode
set laststatus=2

" python-syntax
let g:python_highlight_all = 1

" fzf.vim
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-t> :Tags<CR>

" lightline
let g:lightline = {
    \   'colorscheme': 'jellybeans',
    \   'active': {'right': [['lineinfo'], ['percent'], ['lint_check','lint_err', 'lint_warn', 'lint_info', 'lint_ok'], ['gitbranch']]},
    \   'component_function': {'gitbranch': 'gitbranch#name'},
    \   'component_expand': {
    \       'lint_check': 'lightline#ale#checking',
    \       'lint_info': 'lightline#ale#infos',
    \       'lint_warn': 'lightline#ale#warnings',
    \       'lint_err': 'lightline#ale#errors',
    \       'lint_ok': 'lightline#ale#ok',
    \   },
    \   'component_type': {
    \       'lint_check': 'right',
    \       'lint_info': 'right',
    \       'lint_warn': 'warning',
    \       'lint_err': 'error',
    \       'lint_ok': 'right',
    \   },
    \ }

let g:lightline.tabline = {
	\   'left': [ [ 'tabs' ] ],
    \   'right': [],
	\ }

let g:lightline.tab = {
	\   'active': [ 'filename', 'modified' ],
	\   'inactive': [ 'filename', 'modified' ],
    \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 0
let g:go_auto_type_info = 1
let g:go_def_reuse_buffer = 1
let g:go_diagnostics_level = 2
let g:go_imports_autosave = 0
let g:go_jump_to_error = 0

map <leader>gt :GoAddTags<cr>
map <leader>gi :GoImports<cr>

" tagbar
let g:tagbar_width = 50
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_compact = 2
let g:no_status_line = 1
let g:tagbar_silent = 1
let g:tagbar_show_visibility = 0
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables:1',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields:1',
        \ 'e:embedded:1',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nnoremap <silent> <F12> <Cmd>:TagbarToggle<CR>
inoremap <silent> <F12> <Cmd>:TagbarToggle<CR>

" nerdtree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeIgnore=['\.py[c,o]$', '__pycache__']

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

nnoremap <silent> <C-n> <Cmd>:call NERDTreeToggleInCurDir()<CR>
inoremap <silent> <C-n> <Cmd>:call NERDTreeToggleInCurDir()<CR>

" ale
let g:airline#extensions#ale#enabled = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_popup_menu_enabled = 0
let g:ale_completion_enabled = 0
let g:ale_update_tagstack = 0
let g:ale_hover_cursor = 0
let g:ale_set_loclist = 0

let g:ale_use_global_executables = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 1
let g:ale_set_quickfix = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 100

let g:ale_go_gopls_init_options = {'ui.diagnostic.analyses': {
    \ 'composites': v:false,
    \ 'unusedparams': v:true,
    \ 'shadow': v:true,
    \ }}

let g:ale_linters = {
    \ 'go': ['gopls', 'govet'],
    \ 'python': ['pylint'],
    \ 'sh': ['shellcheck'],
    \ }

let g:ale_fixers = {
    \ 'python': ['yapf'],
    \ }

let g:ale_sign_error = '->'
let g:ale_sign_warning = ' *'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" deoplete
call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'auto_complete_popup': 'manual',
    \ 'on_text_changed_i': v:false,
    \ 'on_insert_enter': v:false,
    \ 'max_list': 50,
    \ })

call deoplete#custom#option('omni_patterns', {
    \ 'go': '[^. *\t]\.\w*',
    \ })

call deoplete#custom#option('sources', {
    \ '_': ['ale'],
    \ })

let g:deoplete#enable_at_startup = 1

" startify
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']  },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ { 'type': 'commands',  'header': ['   Commands']  },
    \ ]

let g:startify_bookmarks = [
    \ {'v': '~/.vimrc'},
    \ {'i': '~/.config/i3/config'},
    \ {'p': '~/.config/polybar/config'},
    \ {'n': '~/Documents/notes/local.md'},
    \ ]

let g:startify_session_sort = 1
let g:startify_session_number = 5
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]

" remove extra spaces
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre * :call CleanExtraSpaces()

autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\<nl>\"|$
autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python3\"\<nl>\<nl>\"|$

" custom filetypes
autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile

" auto-check file changes (for reload)
autocmd FocusGained,BufEnter * checktime

" ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" don't skip wrapped lines
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
vnoremap <expr> k v:count == 0 ? 'gk' : 'k'
vnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" toggle off search highlight
map <leader><ESC> :noh<CR>

command Q :qall

" Try to prevent using the arrow keys for movement.
"nnoremap <Left>  :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up>    :echoe "Use k"<CR>
"nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
"inoremap <Left>  <ESC>:echoe "Use h"<CR>
"inoremap <Right> <ESC>:echoe "Use l"<CR>
"inoremap <Up>    <ESC>:echoe "Use k"<CR>
"inoremap <Down>  <ESC>:echoe "Use j"<CR>
