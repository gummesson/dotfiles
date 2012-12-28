set nocompatible    " No compatibility
filetype plugin on  " Detect filetype
syntax enable       " Enable syntax highighting

filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation

set backspace=indent,eol,start  " Make backspaces work

" Set window size
if has("gui_running")
  if has ("gui_gtk2")
    set lines=30       " Linux
    set columns=90
  else
    set lines=40       " Windows
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

set background=dark    " Set dark background
colorscheme solarized  " Solarized theme

set number             " Line numbering
set cursorline         " Highlight current line
set foldmethod=manual  " Enable code folding
set laststatus=2       " Display status line

" Set two spaces as default
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Word wrap without line breaks
set wrap           
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l