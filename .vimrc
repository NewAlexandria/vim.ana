" load the bundler
call pathogen#infect()
filetype plugin indent on

" Auto-regenerate tags after saving files
au BufWritePost *.rb silent! !ctags -R &
au BufWritePost *.js silent! !ctags -R &

"enjoy an immediate quit without reviewing unread buffers
map :Q :qa
map :wq :xa
map j 5gj
map k 5gk


" text stuff
set tabstop=4 
set ts=2 
set shiftwidth=2 
set autoindent
set expandtab
retab  " this will cause all existing tabs to be expanded
" remove trailing whitespaces
nnoremap <C-r> :%s/\s\+$//e<CR>
" set list  "show whitespace and invisible characters


"" Modes
nnoremap <C-i> :set invpaste paste?<CR>
set pastetoggle=<F2>
call togglebg#map("<F5>")
set showmode
"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv


"" Movements
set foldmethod=marker     " Enable folding by fold markers
set foldclose=all         " Autoclose folds, when moving out of them
set scrolljump=5          " Jump 5 lines when running out of the screen
set scrolloff=3           " Indicate jump out of the screen when 3 lines before end of the screen
" MovingThroughCamelCaseWords
nnoremap <silent><C-Left>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>



" Unite navigations
nnoremap <C-P> :Unite -start-insert file_rec/async<cr>
nnoremap <C-p> :Unite -start-insert file_rec<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>t :Unite -start-insert tag<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
let g:unite_source_file_rec_max_cache_files = 50000

" Use ack search
if executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
 "let g:unite_source_grep_recursive_opt = ''
endif

"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter
set infercase     " Infer the current case in insert completion
map <Leader>\ :noh<cr>

" IDE
set cmdheight=2
set history=50
set showmatch
set number
set cursorline


" Split VIEWPORT horizontally, with new split on the top
let g:buffergator_viewport_split_policy = "b"
let g:buffergator_suppress_keymaps="1"
let g:buffergator_autodismiss_on_select=0
let g:buffergator_split_size=18

" NERDtree settings
let NERDTreeShowHidden=1 
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_open_on_gui_startup = 1
let g:nerdtree_tabs_no_startup_for_diff = 1
let g:nerdtree_tabs_smart_startup_focus = 1
let g:nerdtree_tabs_autoclose = 1


" Setup the buffers
" we set buffergator_autoupdate serially after toggling buffergator to avoid
" creating a buffer listing NERD_tree_1 due to focus issues
autocmd VimEnter * NERDTree
autocmd VimEnter * BuffergatorToggle
autocmd VimEnter * let g:buffergator_autoupdate=1
autocmd VimEnter * wincmd b


"" Buffer Navigation
" Toggle left sidebar: NERDTree and BufferGator
" test per http://justmao.name/life/integrate-nerdtree-and-buffergator/
fu! LSidebarToggle()
  let b = bufnr("%")
  execute "NERDTreeToggle | BuffergatorToggle"
  execute "set nonumber!"
  execute ( bufwinnr(b) . "wincmd w" )
endf
map  <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>
map! <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>

map <Leader>n :NERDTreeFocus<cr>
map <Leader>nf :NERDTreeFind<cr>
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
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=234 guibg=#2c2d27
" let &colorcolumn="80,".join(range(120,999),",")

let g:solarized_italic     = 1
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1
let g:solarized_visibility = 'low'

au BufRead,BufNewFile *.thor set filetype=ruby

let g:Powerline_symbols = 'fancy'

