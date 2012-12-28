" gVim settings

set nocompatible        " No compatibility with Vi
call pathogen#infect()  " Enable the Pathogen plugin for easier plugin management
filetype plugin on      " Detect filetype
syntax on               " Enable syntax highighting

" Enable NERDTree
autocmd vimenter * NERDTree

set background=dark    " Set dark background
colorscheme solarized  " Solarized theme

" Set window size
if has("gui_running")
  if has ("gui_gtk2")
    set lines=30       " Linux (smaller screen)
    set columns=90
  else
    set lines=40       " Windows (bigger screen)
    set columns=120
  end
endif

" Set a visual line-length limit to 80 columns by highlighting column 81
if exists("+colorcolumn")
  set colorcolumn=81
endif

" Set font for GUI
if has("gui_running")
  if has ("gui_gtk2")
    set guifont=Liberation\ Mono\ 10          " Linux
  else
    set guifont=Liberation_Mono:h10:cDEFAULT  " Windows
  end
endif

set nowrap             " No word wrap
set number             " Show line numbering
set cursorline         " Highlight current line
set showmatch          " Show matching parenthesis
set foldmethod=manual  " Enable code folding
set laststatus=2       " Display status line

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set smarttab               " insert tabs on the start of a line according to shiftwidth, not tabstop

" Set two spaces as default
set shiftwidth=2
set tabstop=2
set softtabstop=2

set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
set pastetoggle=<F2>            " Enable pasting without indentation

set hlsearch    " Highlight search terms
set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, case-sensitive otherwise

set history=1000     " Remember more commands and search history
set undolevels=1000  " Enable many, many undos

" Disable backups
set nobackup
set noswapfile

" Keybindings
inoremap <C-space> <esc>  " Map Esc to Ctrl+Space
map <C-s> :w<cr>          " Map :w to Ctrl+S

" Map YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <esc>:YRShow<cr>
