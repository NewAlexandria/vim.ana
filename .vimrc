" load the bundler
call pathogen#infect()
filetype plugin indent on

" text stuff
set tabstop=4 
set ts=2 
set shiftwidth=2 
set autoindent
set expandtab
" 80 col-width notification
highlight OverLength ctermbg=black  guibg=#173642
match OverLength /\%81v.\+/

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

""" Code folding options
map <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
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

" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
