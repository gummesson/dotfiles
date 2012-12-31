" Word wrap without line breaks
set wrap           
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l

" Remove color column
if exists("+colorcolumn")
  set colorcolumn=0
endif

" Remove line highlight
set nocursorline