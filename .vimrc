" load the bundler
call pathogen#infect()
filetype plugin indent on

" text stuff
set tabstop=4 
set ts=2 
set shiftwidth=2 
set autoindent
set expandtab
retab  " this will cause all existing tabs to be expanded

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
set cursorline
"enjoy an immediate quit without reviewing unread buffers
map :q :qa
map :wq :xa
map j 5gj
map k 5gk
" set list  "show whitespace and invisible characters

" NERDtree settings
let NERDTreeShowHidden=1 
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_autoclose = 1

" Split VIEWPORT horizontally, with new split on the top
let g:buffergator_viewport_split_policy = "b"
let g:buffergator_suppress_keymaps="1"
let g:buffergator_autodismiss_on_select=0
let g:buffergator_split_size=12
let g:buffergator_autoupdate=1


" Setup the buffers
autocmd VimEnter * NERDTree
autocmd VimEnter * BuffergatorToggle
autocmd VimEnter * wincmd b

"" Buffer Navigation
" Toggle left sidebar: NERDTree and BufferGator
" test per http://justmao.name/life/integrate-nerdtree-and-buffergator/
fu! LSidebarToggle()
  let b = bufnr("%")
  execute "NERDTreeToggle | BuffergatorToggle"
  execute ( bufwinnr(b) . "wincmd w" )
endf
map  <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>
map! <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>

map <Leader>n :NERDTreeCWD<cr>
map <Leader>b :BuffergatorOpen<cr>
map <Leader>v :wincmd b<cr>

map <Leader>] :bnext<cr>
map <Leader>[ :bprevious<cr>
map <Leader>} :blast<cr>
map <Leader>{ :bfirst<cr>

"" Syntax Coloring
syntax enable
colorscheme solarized

set background=dark
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=234 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

let g:solarized_italic     = 1
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1
let g:solarized_visibility = 'low'

au BufRead,BufNewFile *.thor set filetype=ruby

let g:Powerline_symbols = 'fancy'
