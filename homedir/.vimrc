" ======================================================
" Vim-plug
" ======================================================
"

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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Edit
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary' "gcc - comment line,gc{motion}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Language specific
Plug 'HerringtonDarkholme/yats.vim', {'for': ['javascript', 'typescript']}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'valloric/matchtagalways', {'for': ['html', 'xml', 'xhtml']}
Plug 'vim-scripts/closetag.vim', {'for': ['html', 'xml', 'xhtml']}
Plug 'lumiliet/vim-twig', {'for': 'twig'}

" Colors
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'vim-scripts/ScrollColors'

"Appearance (dev-icons)
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ======================================================
" Basic settings
" ======================================================
set guifont=FiraCode\ Nerd\ Font\ Mono:h16
let mapleader      = ","
let maplocalleader = ","
set number
"Toggle between relative/absolute modes depending on INSER/NORMAL mode as well as active/inactive buffer
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
set showcmd "show last command
set autoindent
set smartindent
set linebreak "smart wrap lines
set breakindent
set visualbell
set tabstop=2 shiftwidth=2
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
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
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
set noshowmode


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
" Make Y behave like other capitals
nnoremap Y y$

" Buffers navigation
map <A-l> :bn<cr>
map <A-h> :bp<cr>
map <A-d> :bd<cr>

" Quickly edit/reload the vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

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

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"==== <coc.nvim>
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-tsserver', 'coc-eslint', 'coc-explorer', 'coc-go', 'coc-html', 'coc-prettier', 'coc-python', 'coc-sh', 'coc-sql', 'coc-yaml', 'coc-lua']

" Use <c-space> to trigger completion options
inoremap <silent><expr> <NUL> coc#refresh()
" Use <enter> to trigger completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> <C-b> <Plug>(coc-definition)

" Formatting selected code.
xmap <silent> <A-f> <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

nnoremap <A-f> :Format<cr>

"==== </coc.nvim>
" Ag-search
nnoremap <leader>ag :Ag
let g:ag_working_path_mode="ra"

" CtrlP
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'package.json', 'build.gradle.kts', 'build.gradle']
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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

" vim-commentary
" key-mappings for comment line in normal mode
noremap  <silent> <C-/> :Commentary<CR>
" key-mappings for range comment lines in visual <Shift-V> mode
vnoremap <silent> <C-/> :Commentary<CR>

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
let g:NERDTreeGitStatusUseNerdFonts = 1

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
