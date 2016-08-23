"*** Vundle plugin manager *******************
"*********************************************
set nocompatible

filetype off
if has("win32")
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin('~/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin('~/.vim/bundle/')
endif
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/ScrollColors'
Plugin 'flazz/vim-colorschemes'
"Plugin 'vim-scripts/YankRing.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'amix/open_file_under_cursor.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'fsharp/vim-fsharp'
"Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
"Plugin 'sirver/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nvie/vim-togglemouse'
Plugin 'rking/ag.vim'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'szw/vim-tags'
call vundle#end() 
filetype plugin on
filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"*********************************************
"*********************************************


"**************Settings***************
"*********************************************

"Gui options
if has('gui_running')
    au GUIEnter * simalt ~x
    set guioptions+=c
    set guioptions+=e
    set guioptions+=g
    set guioptions-=T
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guifont=Powerline_Consolas:h12:cRUSSIAN
endif

"General settings
if $TERM == "xterm-256color"
  set t_Co=256
endif
colorscheme lucius
let g:lucius_style='light'
let g:lucius_contrast='low'
let g:lucius_contrast_bg='low'
let g:lucius_use_bold=0
let g:lucius_use_underline=0
syntax enable
map <S-F12> :hi CursorLine term=NONE cterm=NONE<CR>
let mapleader=","
set tags=./tags;~,tags;~,./.git/tags;~,.git/tags;~
set showcmd
set clipboard=unnamed
set laststatus=2 "Displaying status line always
set visualbell t_vb= 
set novisualbell 
set relativenumber "Numbers on the left
set numberwidth=5
set autoindent
set smartindent
set showmatch "Show matching parenthesis
set cursorline
set hidden "It hides buffers instead of closing them
set title
set nobackup
set wildmode=longest,list,full " visual autocomplete for command menu
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to.
" Deciaml format for C-a, C-x commands.
set nrformats=
" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqapkup
" Quickly edit/reload the vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
"Clear search highliting AND clear search pattern
nnoremap <leader><space> :noh<CR>:let @/ = ""<CR>
"Highlight words under cursor BUT without moving the cursor
nnoremap <leader>h :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
"If you forget to sudo edit the file
cmap w!! w !sudo tee % >/dev/null
" highlight last inserted text
nnoremap gV `[v`]
" save session
nnoremap <leader>s :mksession<CR>
" Change current directory to current file's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Close all buffers
map <leader>ba :1,1000 bd!<cr>
" Vim-like tab navigation
nnoremap tf :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap td :tabclose<CR>
nnoremap te :tabedit<Space>
nnoremap tm :tabm<Space>
nnoremap to :tabonly<CR>
" Vim-like buffer navigation
nnoremap <leader>bn :buffernext
"Quickly insert parenthesis etc.
inoremap {<CR> {<CR>}<esc>O
inoremap $( ()<esc>i
inoremap $[ []<esc>i
inoremap ${ {}<esc>i
inoremap $" ""<esc>i
inoremap $' ''<esc>i
"Surround the visual selection in parenthesis/brackets/etc
vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>

"Encoding
if has("multi_byte")
    set encoding=utf-8
    "let &termencoding=&encoding
    set fileencoding=utf-8
    "set bomb
    set fileencodings=ucs-bom,utf-8,cp1251,cp866,koi8-r,latin1
endif

"Whitespace
set nowrap
set tabstop=4 shiftwidth=4
set shiftround
set expandtab
set backspace=indent,eol,start

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Russian keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

"*******Plugin settings*******

"General
map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
map <F5> :make<CR>
nnoremap <F1> :TagsGenerate
"maps C-SPACE for tag search
nnoremap <NUL> :CtrlPTag<CR>
nnoremap <leader>a :Ag

"Python
if has("win32")
    autocmd FileType python :nnoremap <F5> :!start cmd /k "python %" & pause<CR>
else
    autocmd FileType python :nnoremap <F5> :!python %<CR>
endif
let python_highlight_all = 1

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"Show buffer number in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

"Tagbar
let g:tagbar_width = 45
let g:tagbar_sort = 0
let g:tagbar_show_linenubmers = -1
let g:tagbar_compact = 1

"YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'fsharp' : 1
      \}
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'fsharp' : 1
      \}
let g:ycm_key_list_previous_completion = ['<C-TAB>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1

"Syntastic
let g:syntastic_java_checkers = ["javac"]
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["java"] }

"CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"Vim-tags
let g:vim_tags_auto_generate = 0
