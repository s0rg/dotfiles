set nocompatible
filetype plugin indent off

set runtimepath+=$GOROOT/misc/vim
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

if (has("termguicolors"))
 set termguicolors
endif

colorscheme jellybeans

let &t_ut=''

set wildmenu
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set expandtab
set autoindent
set switchbuf=usetab,newtab
set cursorline
set number
set lazyredraw
set showmatch
set encoding=utf8
set nu
set mousehide
set novisualbell
set backspace=indent,eol,start whichwrap+=<,>,[,]
set nowrap
set linebreak
set nobackup
set nowb
set noswapfile
set nospell
set ttyfast
set redrawtime=15000
set cindent

set hlsearch
set ignorecase
set incsearch
set smartcase

set titlestring=vim:\ %f
set title

set foldmethod=syntax
set foldnestmax=3
set nofoldenable

set completeopt=longest,menuone
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set splitbelow
set splitright

set termwinsize=6x0

set noshowmode
set laststatus=2

let g:python_highlight_all = 1

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

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

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

let g:tagbar_width = 60
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

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](\.git|vendor)$'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0

let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeMarkBookmarks = 0
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeIgnore=['\.py[c,o]$', '__pycache__']

let g:airline#extensions#ale#enabled = 0
let g:ale_popup_menu_enabled = 0
let g:ale_completion_enabled = 0
let g:ale_update_tagstack = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_hover_cursor = 0

let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 50

let g:ale_linters_explicit = 1
let g:ale_use_global_executables = 1

let g:ale_go_gopls_init_options = {'ui.diagnostic.analyses': {
    \ 'composites': v:false,
    \ 'unusedparams': v:true,
    \ 'shadow': v:true,
    \ }}

let g:ale_linters = {
    \ 'go': ['gopls', 'govet'],
    \ 'python': ['pylint'],
    \ }

let g:ale_fixers = {
    \ 'python': ['yapf'],
    \ }

let g:ale_sign_error = '->'
let g:ale_sign_warning = ' *'

call deoplete#custom#option({
    \ 'auto_complete_delay': 0,
    \ 'auto_complete_popup': 'manual',
    \ 'on_text_changed_i': v:false,
    \ 'on_insert_enter': v:false,
    \ 'max_list': 50,
    \ })

call deoplete#custom#option('omni_patterns', {
    \ 'go': '[^. *\t]\.\w*'
    \ })

call deoplete#custom#option('sources', {
    \ '_': ['ale'],
    \ })

let g:deoplete#enable_at_startup = 1


function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction


map <C-n> :call NERDTreeToggleInCurDir()<CR>
nmap <F12> :TagbarToggle<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

autocmd BufWritePre * %s/\s\+$//e
