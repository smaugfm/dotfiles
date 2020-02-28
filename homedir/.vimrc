"                                           ____
"    _________ ___  ____ ___  ______ _     / __/___ ___
"   / ___/ __ `__ \/ __ `/ / / / __ `/    / /_/ __ `__ \
"  (__  ) / / / / / /_/ / /_/ / /_/ /    / __/ / / / / /
" /____/_/ /_/ /_/\__,_/\__,_/\__, /____/_/ /_/ /_/ /_/
"                            /____/_____/
"
" ======================================================


" ======================================================
" Vim-plug
" ======================================================

set nocompatible

" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if has("win32")
else
    call plug#begin('~/vimfiles/plugins/')
    call plug#begin('~/.vim/plugins/')
endif
"Future use
"Plug 'vim-scripts/YankRing.vim'
"Plug 'mattn/emmet-vim'

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" Edit
Plug 'maralla/completor.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary' "gcc - comment line,gc{motion}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
if has("unix")
    Plug 'rking/ag.vim'
endif

" Language specific
Plug 'HerringtonDarkholme/yats.vim', {'for': 'javascript'}
"Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'fsharp/vim-fsharp', {'for': 'fsharp'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'mattn/emmet-vim', {'for': ['html']}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'valloric/matchtagalways', {'for': ['html', 'xml', 'xhtml']}
Plug 'vim-scripts/closetag.vim', {'for': ['html', 'xml', 'xhtml']}

" Colors
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'vim-scripts/ScrollColors'

call plug#end()

" ======================================================
" Basic settings
" ======================================================

let mapleader      = ","
let maplocalleader = ","
set relativenumber "Numbers on the left
set showcmd "show last command
set autoindent
set smartindent
set wrap "wrap long lines
set linebreak "smart wrap lines
set breakindent
set visualbell
set tabstop=4 shiftwidth=4
set shiftround "round indent to shiftwidth
set expandtab
set backspace=indent,eol,start
set timeoutlen=500
set hlsearch
set incsearch
set ignorecase smartcase
set clipboard=unnamed
set laststatus=2 "Displaying status line always
set numberwidth=5
set scrolloff=8 "show defined nubmer of columns when scrolling
set showmatch "Show matching parenthesis
set cursorline
set hidden "It hides buffers instead of closing them
set title
set nobackup
set wildmode=longest,list,full " visual autocomplete for command menu
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to.
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp1251,cp866,koi8-r,latin1
set diffopt=filler,vertical
set nostartofline "keep cursor on the same column
set completeopt=menu,menuone,preview

" Deciaml format for C-a, C-x commands.
set nrformats=

" Annoying temporary files
set backupdir=/tmp,.
set directory=/tmp,.

"Russian keymap
set keymap=russian-jcukenwintype
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Colorschemes
colorscheme lucius
set background=light
let g:lucius_contrast='normal'
let g:lucius_contrast_bg='normal'
let g:lucius_use_bold=0
let g:lucius_use_underline=0

" ======================================================
" Lightline
" ======================================================

set noshowmode
set showtabline=2
let g:lightline = {
            \ 'colorscheme': 'lucius',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'filename', 'fugitive' ], [ 'go', 'ctrlpmark' ] ],
            \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename', 'fugitive' ] ],
            \   'right': [ [ 'lineinfo' ], [ 'filetype', 'percent' ] ]
            \ },
            \ 'tabline': {
            \   'left': [ [ 'tabsWord', 'tabs' ] ],
            \   'right': [ [ 'bufferline' ] ],
            \ },
            \ 'component': {
            \   'tabsWord': 'tabs',
            \ },
            \ 'component_function': {
            \   'readonly': 'LightLineReadonly',
            \   'lineinfo': 'LightLineInfo',
            \   'percent': 'LightLinePercent',
            \   'modified': 'LightLineModified',
            \   'go': 'LightLineGo',
            \   'filename': 'LightLineFilename',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \ },
            \ 'component_expand': {
            \   'bufferline': 'LightLineBufferline',
            \   'tabs': 'lightline#tabs',
            \ },
            \ 'component_type': {
            \   'bufferline': 'tabsel',
            \ },
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
            \ }
" vim-bufferline
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 1
let g:bufferline_modified = ' +'

function! ToSymbol(str)
    if a:str != ''
        return ' '.WebDevIconsGetFileTypeSymbol(
                    \ bufname(str2nr(strpart(a:str, 0, 1))))
    else
        return ''
    endif
endfunction

function! LightLineBufferline()
    call bufferline#refresh_status()
    let prev = g:bufferline_status_info.before
    let cur = g:bufferline_status_info.current
    let next = g:bufferline_status_info.after
    return [prev, cur . ToSymbol(cur), next]
endfunction


function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? "\ue0a2" : ''
endfunction

function! LightLineInfo()
    return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
    return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineModified()
    return &ft =~ 'help' || expand('%:t') =~ 'vimfiler|unite|vimshell' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineGo()
    return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol() . ' '. &fileformat) : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : '') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" ======================================================
" General mappings
" ======================================================

" Clear search highliting AND clear search pattern
nnoremap <leader><space> :noh<CR>:let @/ = ""<CR>
" Highlight words under cursor but without moving the cursor
nnoremap <leader>l :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" If you forget to sudo edit the file
cmap w!! w !sudo tee % >/dev/null
" highlight last inserted text
nnoremap gV `[v`]
" save session
nnoremap <leader>s :mksession
" Change current directory to current file's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Make Y behave like other capitals
nnoremap Y y$

" Vim-like tab navigation
nnoremap tf :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap <C-M-l> :tabnext<CR>
nnoremap <C-M-h> :tabprev<CR>
nnoremap td :tabclose<CR>
nnoremap tn :tabnew<cr>

" Quickly edit/reload the vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" F-keys
noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :TagbarToggle<CR>
noremap <F1> :TagsGenerate

" Build
noremap <leader>b :make<CR>

" Maps C-SPACE for tag search
nnoremap <NUL> :CtrlPTag<CR>

" Markdown headings
nnoremap <leader>1 m`yypVr=``
nnoremap <leader>2 m`yypVr-``
nnoremap <leader>3 m`^i### <esc>``4l
nnoremap <leader>4 m`^i#### <esc>``5l
nnoremap <leader>5 m`^i##### <esc>``6l:w

" Moving lines
nnoremap <silent> <C-k> :execute ":move ".max([0,         line('.') - 2])<cr>
nnoremap <silent> <C-j> :execute ":move ".min([line('$'), line('.') + 1])<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>

vnoremap <silent> <C-k> :<C-U>execute "normal! gv:move ".max([0,         line("'<") - 2])."\n"<cr>gv
vnoremap <silent> <C-j> :<C-U>execute "normal! gv:move ".min([line('$'), line("'>") + 1])."\n"<cr>gv
vnoremap <silent> <C-l> >gv
vnoremap <silent> <C-h> <gv
vnoremap < <gv
vnoremap > >gv

" Colors
if $TERM =~ "256color"
    set term=xterm-256color
    set t_Co=256
    " disable Background Color Erase (BCE)
    set t_ut=
endif
set termguicolors
syntax enable

" ======================================================
" Plugins/languages
" ======================================================

" Ag-search
nnoremap <leader>ag :Ag

" Python
if has("win32")
    autocmd FileType python :nnoremap <buffer> <F5> :!start cmd /k "python %" & pause<CR>
else
    autocmd FileType python :nnoremap <buffer> <F5> :!python %<CR>
endif
let python_highlight_all = 1

" Markdown
if has("win32")
    autocmd FileType markdown :nnoremap <buffer> <F5> :!start chrome %<CR>
else
    autocmd FileType markdown :nnoremap <buffer> <F5> :!google-chrome %<CR>
endif
let g:vim_markdown_folding_disabled = 1

" vim-go
autocmd FileType go setlocal completeopt=menu,menuone
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 sts=4
autocmd FileType go :noremap <buffer> <F5> :GoRun<cr>
autocmd FileType go :noremap <buffer> <leader>b :GoBuild<cr>
autocmd FileType go :noremap <buffer> <leader>rb :!go build<cr>
autocmd FileType go :noremap <buffer> <leader>rt :GoDescribe<cr>
autocmd FileType go :noremap <buffer> <F2> :GoMetaLinter<cr>
autocmd FileType go :noremap <buffer> <leader>ro :GoDef<cr>
autocmd FileType go :noremap <buffer> <leader>rw :GoImplements<cr>
autocmd FileType go :noremap <buffer> <leader>rf :GoReferrers<cr>
autocmd FileType go :noremap <buffer> <leader>rr :GoRename<cr>
autocmd FileType go :noremap <buffer> <leader>rd :GoDoc<cr>
autocmd FileType go :noremap <buffer> <leader>rgd :GoDocBrowser<cr>
autocmd FileType go :noremap <buffer> <leader>rh :GoSameIdsToggle<cr>
autocmd FileType go :noremap <buffer> <leader>ri :GoInstall<cr>
autocmd FileType go :noremap <buffer> <leader>rgt :GoTest<cr>
autocmd FileType go :noremap <buffer> <leader>rgf :GoTestFunc<cr>

let g:go_auto_type_info = 1
let g:go_fmt_autosave = 0
let g:go_def_reuse_buffer = 1
let g:go_highlight_types = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1

" completor.vim
let g:completor_python_binary = '/usr/bin/python'
let g:completor_gocode_binary = '/usr/bin/gocode'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0

" vim-devicon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" NERDTree
" clone vim :h when NERDtree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 0
