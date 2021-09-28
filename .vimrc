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
let g:netrw_dirhistmax = 0
let g:netrw_banner=0
let g:netrw_hide=1

set mouse="" mousehide

set encoding=utf8 fileencoding=utf-8 termencoding=utf-8 nobomb

set hidden
set autoread
set history=100
set autoindent

set wildmenu wildignore+=*.o,*~,*.pyo,*.pyc,*/.git/*,*/vendor/*

set shiftwidth=4 shiftround
set expandtab smarttab tabstop=4 softtabstop=0

set switchbuf=usetab,newtab
set showmatch matchtime=10
set cursorline
set scrolloff=3

set number
set signcolumn=number

set backspace=indent,eol,start

set nrformats-=octal

set wrap
set whichwrap+=<,>,[,]
set textwidth=121
set colorcolumn=+1

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

set foldmethod=syntax foldlevel=99

set complete=.,w,b,u
set completeopt=longest,menuone

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set splitbelow splitright termwinsize=6x0

set noshowmode laststatus=2

set viminfo=%,<10,'10,/10,:50,h,f0,n~/.vim/cache/.viminfo
"           |  |   |   |   |  |  |  + viminfo file path
"           |  |   |   |   |  |  + file marks 0-9,A-Z 0=NOT stored
"           |  |   |   |   |  + disable 'hlsearch' loading viminfo
"           |  |   |   |   + command-line history saved
"           |  |   |   + search history saved
"           |  |   + files marks saved
"           |  + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" ## PLUGINS

" python-syntax
let g:python_highlight_all = 1


" lightline
let g:lightline = {
    \   'colorscheme': 'jellybeans',
    \   'active': {'right': [
    \       ['lineinfo'],
    \       ['percent'],
    \       ['lint_check','lint_err', 'lint_warn', 'lint_info', 'lint_ok'],
    \       ['gitbranch']
    \   ]},
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


" tagbar
let g:no_status_line = 1
let g:tagbar_width = 50
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_compact = 2
let g:tagbar_silent = 1
let g:tagbar_show_visibility = 0
let g:tagbar_map_togglefold = "<space>"
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


" nerdtree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusline = '%#NonText#'
let g:NERDTreeMapActivateNode='<space>'
let g:NERDTreeIgnore=[
    \ '\.py[c,o]$', '__pycache__',
    \ 'vendor', 'go\.mod', 'go\.sum'
    \ ]


" ale
let g:airline#extensions#ale#enabled = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_popup_menu_enabled = 0
let g:ale_completion_enabled = 0
let g:ale_update_tagstack = 0
let g:ale_hover_cursor = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

let g:ale_echo_delay = 50
let g:ale_echo_msg_format = '[%severity% : %linter%] %code %%s'
let g:ale_use_global_executables = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 250

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_go_gopls_init_options = {'ui.diagnostic.analyses': {
    \ 'unusedparams': v:true,
    \ 'composites': v:false,
    \ 'shadow': v:true,
    \ }}

let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'yaml': ['yamllint'],
    \ 'sh': ['shellcheck'],
    \ 'go': ['gopls', 'govet'],
    \ }

let g:ale_fixers = {
    \ 'python': ['yapf'],
    \ }


" deoplete
call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'auto_complete_popup': 'manual',
    \ 'on_text_changed_i': v:false,
    \ 'on_insert_enter': v:false,
    \ 'max_list': 20,
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
    \ { 'type': 'files',     'header': ['   MRU']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
    \ ]

let g:startify_bookmarks = [
    \ {'v': '~/.vimrc'},
    \ {'i': '~/.config/i3/config'},
    \ {'p': '~/.config/polybar/config'},
    \ {'n': '~/Documents/notes/local.md'},
    \ ]

let g:startify_padding_left = 2
let g:startify_files_number = 5
let g:startify_session_sort = 1
let g:startify_session_number = 2
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]


" pgsql
let g:sql_type_default = 'pgsql'


" editorconfig-vim
let g:EditorConfig_disable_rules = ['tab_width']


" ## FUNCTIONS

" tree for current file
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

" remove extra spaces
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" auto-check file changes (for reload)
autocmd FocusGained,BufEnter * checktime

autocmd BufWritePre * :call CleanExtraSpaces()

autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\<nl>\"|$
autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python3\<nl>\<nl>\"|$

" custom filetypes
autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile

" ensure tabs don't get converted to spaces in Makefiles
autocmd FileType make setlocal noexpandtab

autocmd FileType gitcommit let b:EditorConfig_disable = 1
autocmd FileType gitcommit set textwidth=72

" ## RipGrep

" Bind vim grep to ripgrep
set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m

" ## KEYS

nnoremap <silent> <C-n> <Cmd>:call NERDTreeToggleInCurDir()<CR>
inoremap <silent> <C-n> <Cmd>:call NERDTreeToggleInCurDir()<CR>

" F-keys
set pastetoggle=<F2>
nmap <silent> <F3> <Plug>(ale_next_wrap)
nmap <silent> <F4> :set invnumber<CR>
nnoremap <silent> <F12> <Cmd>:TagbarToggle<CR>
inoremap <silent> <F12> <Cmd>:TagbarToggle<CR>

" window movement (up/down only) via ctrl
nnoremap <C-j>    <C-w>j
nnoremap <C-k>    <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Up>   <C-w>k

" toggle off search highlight
map <leader><ESC> :noh<CR>

" reload VIM's configuration
nnoremap <leader>r :source $MYVIMRC<CR>

" fzf.vim
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>

" toggle fold
nnoremap <space> za

" vim-commentary
noremap cc :Commentary<CR>

" vim-go
autocmd FileType go nmap <leader>t :GoAddTags<CR>
autocmd FileType go nmap <leader>i :GoImports<CR>
autocmd FileType go nmap <leader>m :GoImplements<CR>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2
" For text file, wrap all the text
autocmd FileType text setlocal formatoptions=tjl1
" For all other files, wrap comments but not the text
autocmd FileType * setlocal formatoptions=cjl1


" disable cursors keys, someday, maybe...
"nnoremap <Left>  :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up>    :echoe "Use k"<CR>
"nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
"inoremap <Left>  <ESC>:echoe "Use h"<CR>
"inoremap <Right> <ESC>:echoe "Use l"<CR>
"inoremap <Up>    <ESC>:echoe "Use k"<CR>
"inoremap <Down>  <ESC>:echoe "Use j"<CR>
