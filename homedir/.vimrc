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
    call plug#begin('~/vimfiles/plugins/')
else
    call plug#begin('~/.vim/plugins/')
endif
"Future use
"Plug 'scrooloose/syntastic'
"Plug 'vim-scripts/YankRing.vim'
"Plug 'mattn/emmet-vim'

" Appearance
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', {'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

" Edit
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'chiel92/vim-autoformat'
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nvie/vim-togglemouse'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
if has("unix")
    Plug 'rking/ag.vim'
    Plug 'szw/vim-tags'
    Plug 'valloric/youcompleteme'
endif

" Languages
Plug 'HerringtonDarkholme/yats.vim', {'for': 'javascript'}
Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'fsharp/vim-fsharp', {'for': 'fsharp'}
Plug 'helino/vim-json', {'for': ['typescript', 'json']}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'fatih/vim-go', {'for': 'go'}

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Browsing
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

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
set expandtab smarttab
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
set list
set listchars=tab:\|\ ,
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp1251,cp866,koi8-r,latin1
set diffopt=filler,vertical
set nostartofline "keep cursor on the same column

"ctags
set tags=./tags;~,tags;~,./.git/tags;~,.git/tags;~

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
" Two-firewatch
" set background=light
" colorscheme two-firewatch
" let g:two_firewatch_italics=1
" let g:airline_theme='twofirewatch'
" One
" set background=light
" colorscheme one
" let g:one_allow_italics=1
" let g:airline_theme='one'
colorscheme lucius
set background=light
let g:lucius_contrast='normal'
let g:lucius_contrast_bg='normal'
let g:lucius_use_bold=0
let g:lucius_use_underline=0

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

" ======================================================
" General mappings
" ======================================================

" Select-all (don't need confusing increment C-a)
noremap  <C-a> gg0vG$
" Clear search highliting AND clear search pattern
nnoremap <leader><space> :noh<CR>:let @/ = ""<CR>
" Highlight words under cursor but without moving the cursor
nnoremap <leader>l :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" If you forget to sudo edit the file
cmap w!! w !sudo tee % >/dev/null
" highlight last inserted text
nnoremap gV `[v`]
" save session
nnoremap <leader>s :mksession<CR>
" Change current directory to current file's directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Make Y behave like other capitals
nnoremap Y y$

" Vim-like tab navigation
nnoremap tf :tabfirst<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap td :tabclose<CR>
nnoremap te :tabedit<Space>

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
noremap <F10> :TagbarToggle<CR>
noremap <F5> :make<CR>
noremap <F1> :TagsGenerate

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
if $TERM == "xterm-256color"
    set t_Co=256
endif
set termguicolors
syntax enable

" Google it
function! s:goog(q)
    let url = 'https://www.google.co.kr/search?q='
    " Excerpt from vim-unimpared
    let q = substitute(
                \ '"'.a:q.'"',
                \ '[^A-Za-z0-9_.~-]',
                \ '\="%".printf("%02X", char2nr(submatch(0)))',
                \ 'g')
    call system('open ' . url . q)
endfunction

vnoremap <leader>? "gy:call <SID>goog(@g)<cr>

" ======================================================
" Plugins/languages
" ======================================================

" Ag-search
nnoremap <leader>ag :Ag

" Python
if has("win32")
    autocmd FileType python :nnoremap <F5> :!start cmd /k "python %" & pause<CR>
else
    autocmd FileType python :nnoremap <F5> :!python %<CR>
endif
let python_highlight_all = 1

" Markdown
if has("win32")
    autocmd FileType markdown :nnoremap <F5> :!start chrome %<CR>
    autocmd FileType markdown :nnoremap <S-F5> :!start chrome https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet<CR>
else
    autocmd FileType markdown :nnoremap <F5> :!google-chrome %<CR>
    autocmd FileType markdown :nnoremap <S-F5> :! google-chrome https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet<CR>
endif
autocmd FileType markdown :AirlineToggleWhitespace
let g:vim_markdown_folding_disabled = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"Show buffer number in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

" Tagbar
let g:tagbar_width = 45
let g:tagbar_sort = 0
let g:tagbar_show_linenubmers = -1
let g:tagbar_compact = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YouCompleteMe
"
" RefactorgoTo
noremap <leader>rg :GoTo
noremap <leader>q :GoToDeclaration
noremap <leader>w :GoToImplementation
" RefactorgotoreFerences
noremap <leader>rf :GoToReferences
" RefactorgetType
noremap <leader>rt :GetType
" RefactorgetgetDoc
noremap <leader>gd :GetDoc
" RefactorRename
noremap <leader>rr :RefactorRename<space>
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

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Vim-tags
let g:vim_tags_auto_generate = 0

" auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsCenterLine = 0
let g:AutoPairsMultilineClose = 0

" vim-autoformat
noremap <leader>af :Autoformat<CR>

" vim-gitgutter
nmap <leader>hh :GitGutterLineHighlightsToggle<CR>
nmap <leader>hj <Plug>GitGutterNextHunk
nmap <leader>hk <Plug>GitGutterPrevHunk

" vim-fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>ga :Git add<space>
nmap <leader>gr :Git reset<space>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpull<CR>
nmap <leader>gl :15<CR>
nmap <leader>gwq :Gwq

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

" Startup of vim
function! StartUp()
    if 0 == argc()
        Startify | NERDTree | wincmd p
    else
        if (filereadable(glob(argv(0))))
            execute 'e' glob(argv(0))
        else
            Startify
            execute 'NERDTree' glob(argv(0))
            wincmd p
        endif
    endif
endfunction
autocmd VimEnter * call StartUp()


" vim-startify
let g:startify_files_number = 5
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 3) - (longest_line / 3)) . v:val')
    return centered_lines
endfunction

autocmd User Startified setlocal buftype=
let g:startify_disable_at_vimenter = 0
let g:ascii = [
            \ '                                         ',
            \ '            -/oyhhddddhhso:.             ',
            \ '         :hNMMMMMMMMMMMMMMMMmy:          ',
            \ '       :dMMMMMMMMMMMMMMMMMMMMMMNo`       ',
            \ '    `+dMMMMMMMMMMMMMMMMMMMMMMMMMMN+      ',
            \ '   -mMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd`    ',
            \ '  `NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm`   ',
            \ '  +MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMy   ',
            \ '  sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm   ',
            \ '  sMM+ohMMMMMMMMMMMMMMMMMMMMMMMMdyohMm   ',
            \ '  +MM    :smMMMMMMMMMMMMMMMMNy:`   oMs   ',
            \ '  .MM+      -odMMMMMMMMMMNy/      `mM-   ',
            \ '   yMN/`       `:ohMMms/.        .hMh    ',
            \ '    sMMMdhso+//+shmsdmdyo//+osydNMMM-    ',
            \ '    .yMMMMMMMMMMMM+`o`mMMMMMMMMMMMMm     ',
            \ '    sMMMMMMMmmMMMs yN-.MMMMMMNmNMMMM:    ',
            \ '    yMMMMh/` .MMMMhMMdmMMMMh`   mMMy`    ',
            \ '     oy/++.  .NMMMMMMMNhNMMy   .s+.      ',
            \ '              dMmsMM:Mm-NMN.             ',
            \ '              oMNoMM/Mm+MM+              ',
            \ '              +MMoMM+MNoMM/              ',
            \ '              /MM+MMoMmsMM:              ',
            \ '              :MM+MM+MmyMM.              ',
            \ '              .MM:MM/MhyMM               ',
            \ '               NM-MN:MsyMm               ',
            \ '                .`+:`o.-/.               ',
            \ '                                         ',
            \]

let g:startify_custom_header = s:filter_header(g:ascii) + s:filter_header(startify#fortune#quote())
