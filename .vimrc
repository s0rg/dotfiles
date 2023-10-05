set nocompatible

" need to be set BEFORE ale loaded
let g:ale_completion_enabled = 0

filetype plugin indent off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on

syntax on
set synmaxcol=240

if (has('termguicolors'))
    set termguicolors
    set t_Co=256
    set t_ut=
endif

let &t_EI .= "\<Esc>[1 q"
let &t_SI .= "\<Esc>[3 q"

colorscheme jellybeans
highlight Folded guibg=Black ctermbg=Black

let &showbreak='↪ '
let g:netrw_hide=1
let g:netrw_banner=0
let g:netrw_dirhistmax=0

set autoread
set history=50
set cmdheight=1
set pumheight=15
set shortmess+=c
set complete-=it
set shell=/bin/zsh
set nrformats-=octal
set ttimeout notimeout
set mouse="" mousehide
set autoindent cindent
set formatoptions=cjl1
set showmatch matchtime=10
set shiftwidth=4 shiftround
set fillchars+=fold:\ ,vert:│
set title titlestring=vim:\ %f
set backspace=indent,eol,start
set textwidth=120 colorcolumn=+1
set nospell nostartofline nobomb
set noerrorbells novisualbell t_vb=
set wrap linebreak whichwrap+=<,>,[,]
set lazyredraw ttyfast redrawtime=8000
set foldmethod=syntax foldlevelstart=99
set sessionoptions=curdir,folds,tabpages
set splitbelow splitright termwinsize=6x0
set cursorline scrolloff=5 sidescrolloff=5
set number numberwidth=5 signcolumn=number
set noshowmode switchbuf=useopen,usetab,newtab
set expandtab smarttab tabstop=4 softtabstop=0
set nobackup nowritebackup noswapfile noundofile
set hlsearch incsearch ignorecase smartcase wrapscan
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
" set completeopt=longest,menuone,noinsert,noselect,preview


" enable Normal mode keys in ru layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

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
set wildignore+=*.o,*~,.git
set wildignore+=*.pyo,*.pyc,__pycache__
set wildignore+=vendor,go.sum

" ripgrep as vim's grep
set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m


" ## PLUGINS

" python-syntax
let g:python_highlight_all = 1


" pgsql
let g:sql_type_default = 'pgsql'


" lexima
let g:lexima_enable_space_rules = 0
let g:lexima_enable_endwise_rules = 0
let g:lexima_enable_newline_rules = 0
let g:lexima_map_escape = ''


" split-join
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''


" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


" lightline
set laststatus=2

function! Symboltype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : '-') : ''
endfunction

function! Symbolformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
    \   'colorscheme': 'jellybeans',
    \   'active': { 'right': [
    \       [ 'lineinfo' ],
    \       [ 'percent' ],
    \       [ 'filetype' ],
    \       [ 'lint_check', 'lint_err', 'lint_warn', 'lint_info', 'lint_ok' ],
    \       [ 'gitbranch' ]
    \   ]},
    \   'component_function': {
    \       'gitbranch': 'gitbranch#name',
    \       'fileformat': 'Symbolformat',
    \       'filetype': 'Symboltype',
    \   },
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
    \   'tabline': {
    \       'left': [ [ 'tabs' ] ],
    \       'right': [],
    \   },
    \   'tab': {
  	\       'active': [ 'filename', 'modified' ],
 	\       'inactive': [ 'filename', 'modified' ],
    \   },
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
let g:go_highlight_operators = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1

let g:go_term_enabled = 1
let g:go_auto_type_info = 1
let g:go_def_reuse_buffer = 1
let g:go_template_use_pkg = 1
let g:go_fmt_fail_silently = 1

let g:go_updatetime = 1000

let g:go_gopls_gofumpt = 0
let g:go_jump_to_error = 0
let g:go_code_completion_enabled = 0
let g:go_highlight_string_spellcheck = 0

let g:go_decls_mode = 'fzf'
let g:go_term_mode = 'split'
let g:go_list_type = 'quickfix'
let g:go_alternate_mode = 'tabedit'
let g:go_gopls_matcher = 'caseSensitive'


" tagbar
let g:tagbar_width = 50
let g:tagbar_silent = 1
let g:tagbar_indent = 1
let g:tagbar_compact = 2
let g:tagbar_scrolloff = 5
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_show_balloon = 0
let g:tagbar_no_status_line = 1
let g:tagbar_show_tag_count = 1
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
let g:ale_virtualtext_cursor = 0
let g:ale_popup_menu_enabled = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_filetype_changed = 0
let g:airline#extensions#ale#enabled = 0

let g:ale_echo_delay = 10
let g:ale_lint_delay = 250

let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_set_highlights = 1
let g:ale_linters_explicit = 1
let g:ale_use_global_executables = 1

let g:ale_sign_error = '⤫'
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
    \ 'zsh': [ 'shellcheck' ],
    \ 'sh': [ 'shellcheck' ],
    \ 'go': [ 'gopls', 'govet' ],
    \ }

let g:ale_fixers = {
    \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
    \ 'python': [ 'yapf', 'isort' ],
    \ 'zsh': [ 'shfmt' ],
    \ 'sh': [ 'shfmt' ],
    \ }


" vim-lsp
let g:lsp_text_edit_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_insert_text_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_completion_documentation_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
" let g:lsp_signature_help_enabled = 0
let g:lsp_signature_help_delay = 400


" asynccomplete-vim
let g:asyncomplete_min_chars = 2


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
    \ { 'type': 'files',     'header': [ '> last'      ] },
    \ { 'type': 'bookmarks', 'header': [ '> bookmarks' ] },
    \ { 'type': 'commands',  'header': [ '> commands'  ] },
    \ ]

let g:startify_bookmarks = [
    \ { 'v': '~/.vimrc'                   },
    \ { 'n': '~/Documents/notes/local.md' },
    \ { 'w': '~/Documents/notes/work.md' },
    \ ]

let g:startify_commands = [
    \ {'s': ['scratchpad', 'enew | setlocal buftype=nofile']},
    \ ]

let g:startify_skiplist = [
    \ '/.vimrc$',
    \ '/local.md$',
    \ ]

let g:startify_custom_header =
    \ startify#pad(split(system('inmfortune | cowsay -f skeleton'), '\n'))


" editorconfig-vim
let g:EditorConfig_disable_rules = [
    \ 'tab_width',
    \ ]


" markdown
let g:markdown_folding = 1
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'python',
    \ 'yaml',
    \ 'json',
    \ 'sql',
    \ 'go',
    \ ]


" fzf
let g:fzf_action = {'ctrl-t':'tab split'}
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \ }


" ## FUNCTIONS

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists('t:NERDTreeBufName')
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr('$') == 1
        q
      endif
    endif
  endif
endfunction

" tree for current file
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    exe ':NERDTreeClose'
  else
    exe ':NERDTreeFind'
  endif
endfunction


" ## AUTO COMMANDS

autocmd! InsertLeave * silent! set nopaste
autocmd! BufWinEnter * syntax sync fromstart
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

augroup FileType make
    autocmd!
    autocmd FileType make let b:EditorConfig_disable = 1
    autocmd FileType make setlocal noexpandtab
augroup END

augroup FileType dockefile
    autocmd!
    autocmd BufNewFile,BufRead Dockerfile* set ft=dockerfile
augroup END

augroup FileType json
    autocmd!
    autocmd FileType json setlocal tabstop=2 shiftwidth=2
augroup END

augroup FileType yaml
    autocmd!
    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
augroup END

augroup FileType fasm
    autocmd!
    autocmd BufNewFile,BufRead *.asm set ft=fasm
    autocmd BufNewFile,BufRead *.inc set ft=fasm
augroup END

augroup FileType text
    autocmd!
    autocmd FileType text setlocal formatoptions=tjl1
augroup END

augroup FileType python
    autocmd!
    autocmd FileType python setlocal autoindent softtabstop=4 formatoptions+=croq smartindent

    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
augroup END

augroup FileType go
    autocmd!
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd FileType go nmap <buffer> <nowait> <leader>t :GoAddTags<CR>
    autocmd FileType go nmap <buffer> <nowait> <leader>c :GoCallers<CR>
    autocmd FileType go nmap <buffer> <nowait> <leader>i :GoImplements<CR>
    autocmd FileType go nmap <buffer> <nowait> <leader>a :GoAlternate!<CR>
    autocmd FileType go nmap <buffer> <nowait> <leader>C :GoCoverageToggle<CR>
    autocmd FileType go nmap <buffer> <nowait> <leader>T <Plug>(go-test-func)
    autocmd FileType go nmap <buffer> <nowait> <leader>d <Plug>(go-def-tab)
    autocmd FileType go nmap <buffer> <nowait> <leader>n <Plug>(go-rename)

    " go install golang.org/x/tools/gopls@latest
    au User lsp_setup call lsp#register_server({
         \ 'name': 'gopls',
         \ 'cmd': {server_info->['gopls', '-remote=auto']},
         \ 'allowlist': ['go'],
         \ })
augroup END

augroup FileType arduino
    nnoremap <buffer> <leader>aa <cmd>ArduinoAttach<CR>
    nnoremap <buffer> <leader>av <cmd>ArduinoVerify<CR>
    nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
    nnoremap <buffer> <leader>as <cmd>ArduinoUploadAndSerial<CR>
augroup END

" Close nerdtree when it's the only buffer left open
autocmd! WinEnter * call s:CloseIfOnlyNerdTreeLeft()

autocmd! FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

augroup vim_enter
    autocmd!
    autocmd VimEnter * normal! :startinsert :stopinsert
    autocmd VimEnter * nested if argc() > 1 && !&diff | tab sball | tabfirst | endif
augroup END

let s:leave_tab = 0

autocmd! TabLeave * let s:leave_tab = tabpagenr()
autocmd! TabEnter * if tabpagenr() != 1 && tabpagenr() == s:leave_tab | tabprevious | endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.py,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    autocmd!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" snippets
let g:UltiSnipsExpandTrigger       = '<C-e>'
let g:UltiSnipsJumpForwardTrigger  = '<C-e>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'priority': 5
    \ }))


" fzf.vim
nmap <silent> <leader>L :Lines<CR>
nmap <silent> <leader>F :Files<CR>
nmap <silent> <leader>G :Rg<CR>


" toggle fold
nmap <silent> <leader><space> za


" vim-commentary
map <silent> <leader>/ :Commentary<CR>


" split-join
nmap <silent> <Leader>sj :SplitjoinJoin<CR>
nmap <silent> <Leader>ss :SplitjoinSplit<CR>


" move lines with Alt + Up/Down
nnoremap <silent> <A-Up> :m -2<CR>
inoremap <silent> <A-Up> <Esc>:m -2<CR>gi
vnoremap <silent> <A-Up> :m '<-2<CR>gvgv

nnoremap <silent> <A-Down> :m +1<CR>
inoremap <silent> <A-Down> <Esc>:m +1<CR>gi
vnoremap <silent> <A-Down> :m '>+1<CR>gvgv


" nerd-tree
nmap <silent> <F1> <Cmd>:call NERDTreeToggleInCurDir()<CR>


" ale
nmap <silent> <F2> <Plug>(ale_next_wrap)


" tagbar
nmap <silent> <F12> <Cmd>:TagbarToggle<CR>


" window movement (up/down only) via ctrl
nmap <C-j>    <C-w>j
nmap <C-k>    <C-w>k
nmap <C-Down> <C-w>j
nmap <C-Up>   <C-w>k


" tab switching
nmap <Tab>     gt
nmap <S-Tab>   gT


" ignore shift-arrows
nnoremap <S-Up>   <Up>
nnoremap <S-Down> <Down>


" toggle off search highlight
map <silent> <leader><ESC> :noh<CR>


" fast exit
map <C-q> :qall!<CR>


" no ex mode
noremap Q     <Nop>


" no C-z action
noremap <C-z> <Nop>


" makes dd delete, not copy
nnoremap d "_d
vnoremap d "_d

nnoremap <C-o> <C-o>zz

nmap <silent> <leader><Enter> !!zsh<CR>
nmap <silent> <leader>J !!jq --sort-keys<CR>

map <silent> <F3> :set invwrap<CR>
map <silent> <F4> :set paste<CR>a
map <silent> <F11> :set invnumber<CR>
