"===================
"  (g)Vim settings
"===================
"
"  + General
"  + Color Scheme
"  + Platform
"  + Visual
"  + Indentation
"  + Search
"  + History
"  + Backups
"  + Plugins
"  + Keys
"  
"===================

"-----------
"  General
"-----------

set nocompatible        " No compatibility with Vi
call pathogen#infect()  " Enable the Pathogen plugin for easier management
syntax on               " Enable syntax highighting
set encoding=utf-8      " Set encoding to UTF-8
filetype plugin on      " Detect filetype

" Remove sound and visual error
set noerrorbells visualbell t_vb=
if has("autocmd")
  autocmd GUIEnter * set visualbell t_vb=      
endif

" Autoreload Vim settings
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
  
set hidden     " Hide the buffers instead of closing them
set autowrite  " Write file while switching
set autoread   " Reload files that has been changed outside of Vim

"----------------
"  Color Scheme
"----------------

" Solarized
let g:solarized_menu=0  " Remove menu
colorscheme solarized   " Solarized theme
set background=dark     " Set dark background

"------------
"  Platform
"------------

if has("gui_running")
  if has("gui_gtk2")                          " Linux (for a smaller screen)
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
set cursorline     " Highlight current line
set laststatus=2   " Display status line
set showcmd        " Show command in bottom right of the screen
set showmode       " Display the current mode
set ruler          " Show line, columns and percentage in status line

set nowrap         " No word wrap
set scrolloff=10   " Enable more context around cursor
set showmatch      " Show matching parenthesis
set wildmenu       " Show options for file/command completion

" Set color column
if exists("+colorcolumn")
  set colorcolumn=81
endif

" Mouse
set mouse=a    " Enable mouse usage
set mousehide  " Hide the mouse cursor while typing


" Code folding
set foldenable         " Enable code folding
set foldmethod=manual  " Use manual code folding
                       " zf: Create fold
                       " za: Open fold
                       " zi: Toogle folding on/off
                       " zd: Remove fold

"---------------
"  Indentation
"---------------

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set smarttab               " Insert tabs on the start of a line according to shiftwidth
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

"-----------
"  Plugins
"-----------

" NERDTreeTabs
let g:nerdtree_tabs_open_on_gui_startup = 0  " Prevent from opening up on startup

if has("gui_running")
  if has("gui_gtk2")
    let g:NERDTreeWinSize = 25  " Set size (Linux)
  else
    let g:NERDTreeWinSize = 30  " Set size (Windows)
  end
endif

"--------
"  Keys
"--------
"
" F1: Toogle NERDTreeTabs
" F2: Toogle (relative) Numbers.vim
" F3: Toogle paste mode
" F4: Remove search highlightning
"
" ,cd: Set current directory as root
"
" j: Move down row by row
" k: Move up row by row
"
"  Shift+Left: Go to previous tab
" Shift+Right: Go to next tab
"
"    Ctrl+Up: Go to top window
"  Ctrl+Down: Go to bottom window
"  Ctrl+Left: Go to left window
" Ctrl+Right: Go to right window
"        ,eq: Make all windows equal in size
"

" Remove help toggling from F1
imap <F1> <nop>
nmap <F1> <nop>
vmap <F1> <nop>

map <F1> :NERDTreeTabsToggle<cr>  " Map NERDTreeTabs to F1
map <F2> :NumbersToggle<cr>       " Map Numbers to F4

set pastetoggle=<F3>            " Enable pasting without indentation
au InsertLeave * set nopaste    " Diable paste mode when leaving insert mode
set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
nmap <F4> :nohl<cr>             " Redraws the screen and removes any search highlighting

let mapleader = ","  " Map leader to ,
set timeoutlen=500   " Faster leader execution

map <leader>cd :cd %:p:h<cr>:pwd<cr>  " Set current directory as root

" Move row by row instead of line by line
nmap k gk  " Up
nmap j gj  " Down

" Tab navigation
map <S-Left> :tabprevious<cr>  " Shift+Left goes to previous tab
map <S-Right> :tabnext<cr>     " Shift+Right goes to next tab

" Window navigation
map <C-Up> <C-W>k     " Ctrl+Up goes to the top window
map <C-Down> <C-W>j   " Ctrl+Down goes to the bottom window
map <C-Left> <C-W>h   " Ctrl+Left goes to the left window
map <C-Right> <C-W>l  " Ctrl+Right goes to the right window

" Window size
map <leader>eq <C-W>=  " Make all windows equal in size
