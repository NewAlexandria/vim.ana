" load the bundler
call pathogen#infect()
filetype plugin indent on

" text stuff
set tabstop=4 
set ts=2 
set shiftwidth=2 
set autoindent
set expandtab
" retab  " this will cause all existing tabs to be expanded

"" Modes
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter

" IDE
set cmdheight=2
set history=50
set showmatch
set number
syntax enable

if has("gui")
  " set the gui options to:
  "		g: grey inactive menu items
  "		m: display menu bar
  "		r: display scrollbar on right side of window
  "		b: display scrollbar at bottom of window
 
  set go=gmr
  set guifont=Courier
endif

let g:Powerline_symbols = 'fancy'
