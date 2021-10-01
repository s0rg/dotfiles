set nocompatible
filetype plugin indent off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

syntax on
" syntax sync fromstart
syntax sync minlines=500
set synmaxcol=200

if (has("termguicolors"))
    set termguicolors
    set t_Co=256
    set t_ut=
endif

colorscheme jellybeans

set history=50
set cmdheight=1
set pumheight=15
set shortmess+=c

let g:netrw_hide=1
let g:netrw_banner=0
let g:netrw_dirhistmax=0

set nrformats-=octal
set fillchars+=vert:│
let &showbreak = '↪ '
set autoread autowrite
set mouse="" mousehide
set autoindent cindent
set formatoptions=cjl1
set showmatch matchtime=10
set cursorline scrolloff=3
set shiftwidth=4 shiftround
set noshowmode laststatus=2
set switchbuf=usetab,newtab
set number signcolumn=number
set title titlestring=vim:\ %f
set backspace=indent,eol,start
set textwidth=121 colorcolumn=+1
set completeopt+=longest,menuone
set foldmethod=syntax foldlevel=99
set wrap linebreak whichwrap+=<,>,[,]
set lazyredraw ttyfast redrawtime=5000
set sessionoptions=curdir,folds,tabpages
set splitbelow splitright termwinsize=6x0
set expandtab smarttab tabstop=4 softtabstop=0
set nobackup nowritebackup noswapfile noundofile
set hlsearch incsearch ignorecase smartcase wrapscan
set nospell nostartofline noerrorbells novisualbell t_vb=
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8 nobomb

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set viminfo=%,<10,'10,/10,:50,h,f0,n~/.vim/cache/.viminfo
"           |  |   |   |   |  |  |  + viminfo file path
"           |  |   |   |   |  |  + file marks 0-9,A-Z 0=NOT stored
"           |  |   |   |   |  + disable 'hlsearch' loading viminfo
"           |  |   |   |   + command-line history saved
"           |  |   |   + search history saved
"           |  |   + files marks saved
"           |  + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list
set wildmenu
set wildignore+=*.o,*~,*/.git/*
set wildignore+=*/vendor/*,go.mod,go.sum
set wildignore+=*.pyo,*.pyc,*/__pycache__/*

" ripgrep as vim's grep
set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m


" ## PLUGINS

" python-syntax
let g:python_highlight_all = 1


" lightline
let g:lightline = {
    \   'colorscheme': 'jellybeans',
    \   'active': { 'right': [
    \       [ 'lineinfo' ],
    \       [ 'percent' ],
    \       [ 'lint_check', 'lint_err', 'lint_warn', 'lint_info', 'lint_ok' ],
    \       [ 'gitbranch' ]
    \   ]},
    \   'component_function': { 'gitbranch': 'gitbranch#name' },
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
	\ 'left': [ [ 'tabs' ] ],
    \ 'right': [],
	\ }

let g:lightline.tab = {
	\ 'active': [ 'filename', 'modified' ],
	\ 'inactive': [ 'filename', 'modified' ],
    \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"


" vim-go
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_diagnostics_level = 2
let g:go_highlight_fields = 1
let g:go_def_reuse_buffer = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1
let g:go_term_enabled = 1
let g:go_term_reuse = 1

let g:go_highlight_string_spellcheck = 0
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
let g:tagbar_map_togglefold = '<space>'
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds': [
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
    \ 'sro': '.',
    \ 'kind2scope': {
        \ 't': 'ctype',
        \ 'n': 'ntype'
    \ },
    \ 'scope2kind': {
        \ 'ctype': 't',
        \ 'ntype': 'n'
    \ },
    \ 'ctagsbin': 'gotags',
    \ 'ctagsargs': '-sort -silent'
    \ }


" nerdtree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeStatusline = '%#NonText#'
let g:NERDTreeMapCustomOpen = '<space>'
let g:NERDTreeCustomOpenArgs = { 'file': { 'where': 't', 'keepopen': 1 } }


" ale
let g:ale_open_list = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_hover_cursor = 0
let g:ale_update_tagstack = 0
let g:ale_popup_menu_enabled = 0
let g:ale_completion_enabled = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:airline#extensions#ale#enabled = 0

let g:ale_echo_delay = 10
let g:ale_lint_delay = 250

let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_linters_explicit = 1
let g:ale_use_global_executables = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%severity% : %linter%] %code %%s'

let g:ale_go_gopls_init_options = { 'ui.diagnostic.analyses': {
    \ 'unusedparams': v:true,
    \ 'composites': v:false,
    \ 'shadow': v:true,
    \ }}

let g:ale_linters = {
    \ 'python': [ 'pylint' ],
    \ 'yaml': [ 'yamllint' ],
    \ 'sh': [ 'shellcheck' ],
    \ 'go': [ 'gopls', 'govet' ],
    \ }

let g:ale_fixers = {
    \ 'python': [ 'yapf' ],
    \ }


" deoplete
call deoplete#custom#option({
    \ 'max_list': 15,
    \ 'auto_complete_delay': 10,
    \ 'auto_complete_popup': 'manual',
    \ 'on_insert_enter': v:false,
    \ 'on_text_changed_i': v:false,
    \ })

call deoplete#custom#option('omni_patterns', {
    \ 'go': '[^. *\t]\.\w*',
    \ })

call deoplete#custom#option('sources', {
    \ '_': [ 'ale' ],
    \ })

let g:deoplete#enable_at_startup = 1


" startify
let g:startify_padding_left = 2
let g:startify_files_number = 4
let g:startify_session_sort = 1
let g:startify_change_to_dir = 0
let g:startify_enable_special = 0
let g:startify_session_number = 2
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]

let g:startify_lists = [
    \ { 'type': 'sessions',  'header': [ '> sessions'  ] },
    \ { 'type': 'files',     'header': [ '> MRU'       ] },
    \ { 'type': 'bookmarks', 'header': [ '> bookmarks' ] },
    \ ]

let g:startify_bookmarks = [
    \ { 'v': '~/.vimrc'                   },
    \ { 'i': '~/.config/i3/config'        },
    \ { 'n': '~/Documents/notes/local.md' },
    \ ]


" pgsql
let g:sql_type_default = 'pgsql'


" editorconfig-vim
let g:EditorConfig_disable_rules = [ 'tab_width' ]


" markdown
let g:markdown_folding = 1
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'python',
    \ 'yaml',
    \ 'sql',
    \ 'go',
    \ ]


" fzf
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \ }


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

autocmd FocusGained,BufEnter * checktime
autocmd CompleteDone * pclose
autocmd BufWritePre * :call CleanExtraSpaces()

autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\<nl>\"|$
autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python3\<nl>\<nl>\"|$

autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile
autocmd FileType make setlocal noexpandtab

autocmd FileType gitcommit let b:EditorConfig_disable = 1
autocmd FileType gitcommit setlocal textwidth=72


" ## KEYS

" split-join keys
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" F-keys
set pastetoggle=<F2>
nmap <silent> <F3> <Plug>(ale_next_wrap)
map <silent> <F4> :set invnumber<CR>
map <silent> <F5> :set invwrap<CR>

nmap <silent> <F12> <Cmd>:TagbarToggle<CR>

" window movement (up/down only) via ctrl
nmap <C-j>    <C-w>j
nmap <C-k>    <C-w>k
nmap <C-Down> <C-w>j
nmap <C-Up>   <C-w>k

" tab switching
nmap <Tab>    gt
nmap <S-Tab>  gT

" toggle text wrapping on/off

" toggle off search highlight
map <leader><ESC> :noh<CR>

" toggle nerdtree
nmap <Leader><space> <Cmd>:call NERDTreeToggleInCurDir()<CR>

" reload VIM's configuration
nmap <leader>r :source $MYVIMRC<CR>

" fzf.vim
nmap <leader>f :Files<CR>
nmap <leader>g :Rg<CR>

" toggle fold
nmap <space> za

" vim-commentary
nmap cc :Commentary<CR>

" vim-go
autocmd FileType go nmap <leader>t :GoAddTags<CR>
autocmd FileType go nmap <leader>i :GoImports<CR>
autocmd FileType go nmap <leader>m :GoImplements<CR>

autocmd FileType yaml setlocal ts=2 sw=2
" For text file, wrap all the text
autocmd FileType text setlocal formatoptions=tjl1


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
