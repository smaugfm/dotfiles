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
"Plugin 'vim-scripts/YankRing.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
"Plugin 'scrooloose/syntastic'
Plugin 'fsharp/vim-fsharp'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'valloric/youcompleteme'
"Plugin 'sirver/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'nvie/vim-togglemouse'
Plugin 'rking/ag.vim'
Plugin 'szw/vim-tags'
"JS/TS
Plugin 'pangloss/vim-javascript'
Plugin 'helino/vim-json'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
"Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Colorschemes
Plugin 'rakr/vim-two-firewatch'
Plugin 'rakr/vim-one'
Plugin 'lifepillar/vim-solarized8'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'atelierbram/vim-colors_atelier-schemes'
Plugin 'vim-scripts/Visual-Studio'
Plugin 'raphamorim/lucario'

call vundle#end()
filetype plugin on
filetype plugin indent on
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
set termguicolors
syntax enable
set background=light
colorscheme two-firewatch
let g:two_firewatch_italics=1
"let g:airline_theme='one'
let g:airline_theme='twofirewatch'

" colorscheme lucius
" let g:lucius_style='dark'
" let g:lucius_contrast='normal'
" let g:lucius_contrast_bg='normal'
" let g:lucius_use_bold=1
" let g:lucius_use_underline=0
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
"Insert mode mappings
imap <C-g>h <Left>
imap <C-g><C-h> <Left>
imap <C-g>l <Right>
imap <C-g><C-l> <Right>
imap <C-g>b <S-Left>
imap <C-g><C-b> <S-Left>
imap <C-g>w <S-Right>
imap <C-g><C-w> <S-Right>
" Use Q for formatting the current paragraph (or selection)
vmap Q gq
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
" Vim-like tab navigation
nnoremap tf :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap td :tabclose<CR>
nnoremap te :tabedit<Space>
nnoremap tm :tabm<Space>
nnoremap to :tabonly<CR>
"Quickly insert parenthesis etc.
inoremap {<CR> {<CR>}<esc>O
inoremap $( ()<esc>i
inoremap $[ []<esc>i
inoremap ${ {}<esc>i
inoremap $" ""<esc>i
inoremap $' ''<esc>i

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
set keymap=russian-jcukenwintype
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

"Markdown
if has("win32")
    autocmd FileType markdown :nnoremap <F5> :!start chrome %<CR>
    autocmd FileType markdown :nnoremap <S-F5> :!start chrome https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet<CR>
else
    autocmd FileType markdown :nnoremap <F5> :!google-chrome %<CR>
    autocmd FileType markdown :nnoremap <S-F5> :! google-chrome https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet<CR>
endif
autocmd FileType markdown :AirlineToggleWhitespace
let g:vim_markdown_folding_disabled = 1

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
noremap <leader>d :GoTo
noremap <leader>q :GoToDeclaration
noremap <leader>w :GoToImplementation
noremap <leader>f :GoToReferences
noremap <leader>t :GetType
noremap <leader>gd :GetDoc
noremap <leader>r :RefactorRename
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
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comments = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"Vim-tags
let g:vim_tags_auto_generate = 0
