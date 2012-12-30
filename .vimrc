"===================
"  (g)Vim settings
"===================
"
"  + General
"  + Color scheme
"  + Platform
"  + Visual
"  + Indentation
"  + Search
"  + History
"  + Backups
"  + Keys
"  + Plugins
"
"===================

"-----------
"  General
"-----------

set nocompatible        " No compatibility with Vi
call pathogen#infect()  " Enable the Pathogen plugin for easier plugin management
syntax on               " Enable syntax highighting
filetype plugin on      " Detect filetype

set noerrorbells visualbell t_vb=          " Remove sound and visual error
if has("autocmd")
  autocmd GUIEnter * set visualbell t_vb=
endif

"----------------
"  Color scheme
"----------------

" Solarized
let g:solarized_menu=0  " Remove menu
colorscheme solarized   " Solarized theme
set background=dark     " Set dark background

"------------
"  Platform
"------------

if has("gui_running")
  if has ("gui_gtk2")                         " Linux (for a smaller screen)
    set lines=35                              " Height
    set columns=100                           " Width
    set guifont=Liberation\ Mono\ 10          " Set font for GUI
    set clipboard=unnamedplus                 " Use + register for copy-paste
  else                                        " Windows (for a bigger screen)
    set lines=45                              " Height      
    set columns=140                           " Width
    set guifont=Liberation_Mono:h10:cDEFAULT  " Set font for GUI
    set clipboard=unnamed                     " Use * register for copy-paste
  end
endif

"----------
"  Visual
"----------

set guioptions-=T  " Hide toolbar
set number         " Show line numbering
set laststatus=2   " Display status line
set showcmd        " Show command in bottom right of the screen
set showmode       " Display the current mode
set autowrite      " Write file while switching
set cursorline     " Highlight current line
set showmatch      " Show matching parenthesis

" Set color column
if exists("+colorcolumn")
  set colorcolumn=81
endif

set nowrap      " No word wrap
set mouse=a     " Enable mouse usage
set mousehide   " Hide the mouse cursor while typing
set foldenable  " Enable code folding

" Code folding settings
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

"---------------
"  Indentation
"---------------

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set smarttab               " insert tabs on the start of a line according to shiftwidth
set expandtab              " Replace tabs with spaces

" Set two spaces as default
set shiftwidth=2
set tabstop=2
set softtabstop=2

"----------
"  Search
"----------

set hlsearch    " Highlight search terms
set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, case-sensitive otherwise

"-----------
"  History
"-----------

set history=1000     " Remember more commands and search history
set undolevels=1000  " Enable many, many undos

"-----------
"  Backups
"-----------

set nobackup    " No backups
set noswapfile  " No swap file

"--------
"  Keys
"--------

set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
set pastetoggle=<F2>            " Enable pasting without indentation
au InsertLeave * set nopaste    " Diable paste mode when leaving insert mode

let mapleader = ","  " Map leader to ,
nmap <C-s> :w<cr>    " Map Ctrl+S to :w

" Easier windows/tabs navigation
map <C-J> <C-W>j<C-W>_ 
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Move row by row instead of line by line
nmap k gk  " Up
nmap j gj  " Down

"-----------
"  Plugins
"-----------

" NERDTree(Tabs)
let g:NERDTreeWinSize = 30                   " Set size
nmap <leader>nt :NERDTree %<cr>              " Map :NERDTree to ,nt (file directory as root)
let g:nerdtree_tabs_open_on_gui_startup = 0  " Prevent from opening on startup
