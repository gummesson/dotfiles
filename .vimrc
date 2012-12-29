" (g)Vim settings

" General settings
set nocompatible        " No compatibility with Vi
call pathogen#infect()  " Enable the Pathogen plugin for easier plugin management
filetype plugin on      " Detect filetype
syntax on               " Enable syntax highighting

" Color scheme settings
let g:solarized_menu=0  " Remove menu
colorscheme solarized   " Solarized theme
set background=dark     " Set dark background

" Platform specific settings
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

" Visual settings
set guioptions-=T  " Hide toolbar
set number         " Show line numbering
set laststatus=2   " Display status line
set showcmd        " Show command in bottom right of the screen
set showmode       " Display the current mode
set autowrite      " Write file while switching
set cursorline     " Highlight current line
set showmatch      " Show matching parenthesis

if exists("+colorcolumn")  " Set color column
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

" Indentation settings
filetype plugin indent on  " Enable indent plugin
set autoindent             " Enable auto indent
set smartindent            " Enable context-sensitive indentation
set smarttab               " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab              " Replace tab with spaces
set shiftwidth=2           " Set two spaces as default
set tabstop=2
set softtabstop=2

" Search specific settings
set hlsearch    " Highlight search terms
set incsearch   " Show search matches as you type
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, case-sensitive otherwise

" History settings
set history=1000     " Remember more commands and search history
set undolevels=1000  " Enable many, many undos

" Backups settings
set nobackup    " No backups
set noswapfile  " No swap file

" Sound settings
set novisualbell

" Keys specific settings and keybindings
set backspace=indent,eol,start  " Enable backspacing over everything in insert mode
set pastetoggle=<F2>            " Enable pasting without indentation 
map <C-J> <C-W>j<C-W>_          " Easier window/tabs navigation
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-s> :w<cr>                " Map Ctrl+S to :w
inoremap <C-space> <esc>        " Map Ctrl+Space to Esc
nmap <leader>nt :NERDTree<cr>   " Map :NERDTree to \nt

