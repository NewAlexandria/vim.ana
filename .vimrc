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
call togglebg#map("<F5>")
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
" set list  "show whitespace and invisible characters

syntax enable
set background=dark
let g:solarized_italic     = 1
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1
let g:solarized_visibility = 'low'
colorscheme solarized

au BufRead,BufNewFile *.thor set filetype=ruby

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
