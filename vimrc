" .vimrc
" Author: Samir Sadek <netsamir@gmail.com>
"
" Automatic reloading of .vimrc
filetype plugin indent on
autocmd! bufwritepost .vimrc source %
call pathogen#infect()
set nocompatible

" Rebind <Leader> key {{{
let mapleader = "\<space>"
let maplocalleader = "\\"
"}}}
" Colors sections {{{
set t_Co=256
set background=dark
syntax enable
"colorscheme solarized

" Create a line at column 80
set colorcolumn=80
highlight ColorColumn ctermbg=233
" }}}
"  Settings sections {{{
set encoding=utf-8
set ruler

syntax on

set pastetoggle=<F3>
set clipboard=unnamedplus

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" Showing line numbers and length
" show line numbers
set relativenumber
" width of document (used by gd)
set tw=0
" don't automatically wrap on load
set nowrap
" don't automatically wrap text when typing
set fo-=t
set formatoptions-=t

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Multiple matches
set wildmenu
set wildmode=full

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

" }}}
" functions settings {{{
" Navigation

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
        return "\<C-P>"
        endif
    endif
    return a:action
endfunction

set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount= v:foldend - v:foldstart
    "let sub = substitute(line, '\v^\"\s+(.+)\s\{.+$','\1', 'g')
    let sub = substitute(line, '\v^.\s+(.+)\s\{.+$','\1', 'g')
    " return foldedlinecount . ' ' . sub
    return substitute(foldtext(), '\v^\W+(\d+).+\:\s+(.+)\s+$', '[\1] [\2]', 'g')
endfunction
" }}}
" Mappings settings {{{

inoremap kj <esc>
inoremap <esc> <nop>

" Execute a command
nnoremap @x <<yy:!^R^O"^M>> 

runtime macros/matchit.vim
map <tab> %

" mappings: Windows and tabpage
" Windows and tabpage: bind Ctrl+<movement> keys to move around the windows,
" instead of using Ctrl+w + <movement>
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
" Complete a filename
inoremap <c-f> <c-x><c-f>
" Complete a line
inoremap <c-l> <c-x><c-l>

nnoremap <leader>l :vsplit<cr><c-w><c-l>
nnoremap <leader>L :split<cr><c-w><c-j>

nnoremap <leader>q :q<cr>
nnoremap + 5<c-w>>
nnoremap _ 5<c-w><
nnoremap = 5<c-w>+
nnoremap - 5<c-w>-

" Open a Quickfix window for the last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" easier moving between args

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap tn <esc>:tabnew<CR>
nnoremap tk <esc>:tabnext<CR>
nnoremap tj <esc>:tabprev<CR>
nnoremap th <esc>:tabfirst<CR>
nnoremap tl <esc>:tablast<CR>

" Keep search maches in the middle of the screen
" not compatible with easymotion
nnoremap n nzz
nnoremap N nzz

" not compatible with easymotion
nnoremap * *<c-o>

" Not necessary anymore with easymotion
" nnoremap <c-n> :noh<CR>

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

nmap <Leader>x :%s/\s\+$//
nnoremap <Leader>g gg=G

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Open a new file
nnoremap <Leader>o :CtrlP<CR>
" Save a file
nnoremap <Leader>w :w<CR>

" Delete line
" noremap , ddO<esc>
" Split line - it is the same than join J
" nnoremap S i<cr><esc><right>

" Around the line : Add a line below
" noremap <space> o <esc>k$
" remove the line below

" map Alt
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

" Move a line
nnoremap <A-k> <esc>:m-2<CR>
nnoremap <A-j> <esc>:m+1<CR>
nnoremap <A-h> <<
nnoremap <A-l> >>
" move block in visual mode
vnoremap <A-h> <gv
vnoremap <A-l> >gv

nnoremap vv ^vg_
" nnoremap O O<esc>j
" easier formatting of paragraphs
noremap Q ^<space>gqap
" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Select the current word
noremap <leader><space> viw
" put the word in uppercase
inoremap <c-u> <esc>viwUA

nnoremap <silent> k gk:noh<cr>
nnoremap <silent> gk k:noh<cr>
nnoremap <silent> j gj:noh<cr>
nnoremap <silent> gj j:noh<cr>
" get vi quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Put the date and time surrounded by line
nnoremap <F2> 79i-<esc>i<cr><C-R>=strftime("%c")<CR><esc>o<esc>79i-<esc>o

" }}}
"  Operator-Pending mappings {{{

onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>


" }}}
"  Abbreviation {{{

iabbrev @@ netsamir@gmail.com
iabbrev ccopy Copyright 2015 Samir Sadek, all rights reserved.
iabbrev ssig -- <cr>Samir Sadek<cr>netsamir@gmail.com
iabbrev <buffer> loveoana ❤  Oana ❤

" }}}
" Autocmd settings {{{
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker keywordprg=:help
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

augroup netsamir_cmd
    autocmd!
    " Indent the file when reading
    autocmd BufRead *.html,*.ejs,*.vue,*.sass :normal gg=G
    autocmd BufNewFile,BufRead *.html
        \ setlocal wrap spell
    autocmd BufNewFile,BufRead *.js,*.vue,*.html,*.css,*.ejs,*.sass,*.scss,*.jade,*.yml,*.pug
        \ setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.ejs set filetype=html

    " Comment lines
    " Replace by plugin
    " autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    " autocmd FileType python     nnoremap <buffer> <localleader>c I# <esc>
augroup END

autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" }}}
" Plugin: nerdtree {{{

map <leader>n :NERDTreeToggle<CR>

"}}}
" Plugin: Statusline and Syntastic {{{

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0

"}}}
" Plugin: Indent-guides {{{
" nothing to defined
" }}}
" Plugin: ctrlp {{{

" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]

"}}}
" Plugin: vim-airline {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline#extensions#tabline#buffer_idx_mode = 1

"}}}
" Plugin: vim-airline-themes {{{

let g:airline_theme='sol'

"}}}
" Plugin: vim-snipeets/vim-addon-mw-utils/vim-snipmaite/tlib_vim {{{
" cd ~/.vim/bundle
" git clone https://github.com/tomtom/tlib_vim.git
" git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
" git clone https://github.com/garbas/vim-snipmate.git
"
" Optional:
" git clone https://github.com/honza/vim-snippets.git

"}}}
" Plugin: Markdown {{{

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_initial_foldlevel = 1

nmap <leader>md :%!Markdown.pl --html4tags<CR>

"}}}
" Plugin: sparkup {{{
" Default
"}}}
" Plugin: tmuxline.vim {{{
" Default
"}}}
" Plugin: vim-fugitive {{{
" Default
"}}}
" Plugin: Tabular plugin {{{
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t\| :Tabularize /\|<CR>
vmap <Leader>t\| :Tabularize /\|<CR>
"
"}}}
" Plugin: vimwiki {{{
" Default
"}}}
" Plugin: easymotion {{{
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" EasyMotion now supports moving cursor across/over window. Since it doesn't make
" sense that moving cursor to other window while Visual or Operator-pending mode,
" overwin motions only provides mappings for Normal mode. Please use nmap to use
" overwin motions. Overwin motions only supports bi-directional motions
nmap s <Plug>(easymotion-overwin-f)

" jk motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"}}}
" Plugin: incsearch.vim {{{
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
      return incsearch#util#deepextend(deepcopy({
        \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
        \   'keymap': {
        \     "\<CR>": '<Over>(easymotion)'
        \   },
        \   'is_expr': 0
        \ }), get(a:, 1, {}))
  endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"}}}
" Plugin: vim-repeat {{{
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" " `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

"}}}
" Plugin: tagbar {{{
nmap <F9> :TagbarToggle<CR>

"}}}
" Plugin: Python/jedi-vim {{{

" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0

"}}}
" Plugin: Python/Syntastic {{{

"let g:syntastic_python_checkers = ['flake8', 'pylint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_style_error_symbol = '>'
let g:syntastic_style_warning_symbol = '>>'
let g:syntastic_error_symbol = '??'
let g:syntastic_warning_symbol = '?'
let g:syntastic_check_on_open = 0
map <F7> <esc>:SyntasticCheck<CR>
map <F8> <esc>:SyntasticToggleMode<CR>

" }}}
"
" CompleteMe {{{ 
 if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
   endif
   let g:ycm_semantic_triggers['typescript'] = ['.']
"
" }}}
"
"  Part of dotbot readme file to enable overriding
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

" Vim repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
