"let s:vim_home = '~/.vim/'
 
"let config_list = [
  "\ 'base.vim',
  "\ 'plugins.vim',
  "\ 'functions.vim',
  "\ 'theme.vim',
  "\ 'settings.vim',
  "\ 'leader.vim',
  "\ 'keymappings.vim',
  "\ 'languages.vim',
  "\ 'plugin_settings/*.vim'
"\]
 
"for files in config_list
  "for f in split(glob(s:vim_home.files), '\n')
    "exec 'source '.f
  "endfor
"endfor


" load the bundler
call pathogen#infect()
filetype plugin indent on


" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Text stuff
set tabstop=4
retab  " this will cause all existing tabs to be expanded
set ts=2
set shiftwidth=2
set autoindent
set expandtab
set nostartofline
let g:matchparen_insert_timeout=5

set wildmenu
set wildmode=list:longest,full
" remove trailing whitespaces
nnoremap <C-r> :%s/\s\+$//e<CR>
" set list  "show whitespace and invisible characters

"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter
set infercase     " Infer the current case in insert completion
map <Leader>\ :noh<cr>
runtime macros/matchit.vim


"" Modes
nnoremap <C-i> :set invpaste paste?<CR>
set pastetoggle=<F2>
call togglebg#map("<F5>")
set showmode
"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" IDE
set cmdheight=2
set history=50
set showmatch
set number
set cursorline


" Diff in gutter
let g:changes_autocmd=1
let g:changes_respect_other_signs = 1
nnoremap <leader>d :CL<cr>

" Blame gutter
map <leader>s :call SvnBlame()<CR>



""================     Movements     ===================""
""                                                      ""

"enjoy an immediate quit without reviewing unread buffers
map :Q :qa
map :wq :xa
map j 5gj
map k 5gk

map <Leader>n :NERDTreeFocus<cr>
map <Leader>nf :NERDTreeFind<cr>
map <Leader>b :BuffergatorOpen<cr>
map <Leader>v :wincmd b<cr>
"nmap <Leader>t :TagbarToggle<CR>

map <Leader>] :bnext<cr>
map <Leader>[ :bprevious<cr>
map <Leader>} :blast<cr>
map <Leader>{ :bfirst<cr>


""================     Navigations     ===================""
""                                                      ""

set foldmethod=marker     " Enable folding by fold markers
set foldclose=all         " Autoclose folds, when moving out of them
set scrolljump=5          " Jump 5 lines when running out of the screen
set scrolloff=3           " Indicate jump out of the screen when 3 lines before end of the screen
" MovingThroughCamelCaseWords
nnoremap <silent><C-Left>  :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" function to toggle number mode
function! g:ToggleNuMode()
    if(&rnu == 1)
        set number
    else
        set relativenumber
    endif
endfunc
" map the above function to F5
nnoremap <f5> :call g:ToggleNuMode()<cr>


" Unite navigations
"nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nnoremap <space>p :<C-u>Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async:!<cr>
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>t :Unite -start-insert tag<cr>
nnoremap <space>o :Unite -start-insert -vertical -winwidth=50 -direction=belowright outline<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
let g:unite_source_file_rec_max_cache_files = 50000

"nnoremap sG :<C-u>execute 'Unite grep:.:-iR:' . expand('<cword>') . ' -default-action=split'<Cr>

"call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Use ack search
"if executable('ack')
  "let g:unite_source_grep_command = 'ack'
  "let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
 ""let g:unite_source_grep_recursive_opt = ''
"endif


""================     Windowing     ===================""
""                                                      ""

" Expand and shrink split sizes
nnoremap <leader>< <C-W><
nnoremap <leader><< 5<C-W><
nnoremap <leader>> <C-W>>
nnoremap <leader>>> 5<C-W>>
nnoremap <leader>, <C-W>-
nnoremap <leader>,, 5<C-W>-
nnoremap <leader>. <C-W>+
nnoremap <leader>.. 5<C-W>+


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

" Tagbar settings
"let g:tagbar_autofocus = 0
"let g:tabgbar_ctags_bin="ctags"
" let g:tagbar_sort = 0

" Setup the buffers
" we set buffergator_autoupdate serially after toggling buffergator to avoid
" creating a buffer listing 'NERD_tree_1' due to focus issues
autocmd VimEnter * NERDTree
autocmd VimEnter * BuffergatorToggle
autocmd VimEnter * let g:buffergator_autoupdate=1
"autocmd VimEnter * wincmd b
"autocmd VimEnter * TagbarToggle
autocmd VimEnter * wincmd w


"" Buffer Navigation
" Toggle left sidebar: NERDTree and BufferGator
" test per http://justmao.name/life/integrate-nerdtree-and-buffergator/
fu! LSidebarToggle()
  let b = bufnr("%")
  execute "NERDTreeToggle | BuffergatorToggle" 
  "| TagbarToggle"
  execute "set nonumber!"
  execute ( bufwinnr(b) . "wincmd w" )
endf
map  <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>
map! <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>


""================  Syntax Coloring  ===================""
""                                                      ""

" Color formatting guide:
" http://misc.flogisoft.com/bash/tip_colors_and_formatting
let g:indentLine_color_term = 0
let g:indentLine_color_gui = '#29393f'
let g:indentLine_char = '¦'   " ┆ ¦
" highlight ColorColumn ctermbg=234 guibg=#2c2d27
"highlight ColorColumn ctermbg=234 guibg=#1c1d17
let &colorcolumn="80,".join(range(120,999),",")
syntax enable
colorscheme solarized

set background=dark

let g:solarized_italic     = 1
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1
let g:solarized_visibility = 'low'

set guifont=Source\ Code\ Pro\ for\ Powerline
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:lightline = {
      "\ 'colorscheme': 'solarized',
      "\ 'component': {
      "\   'readonly': '%{&readonly?"⭤":""}'
      "\ },
      "\ 'separator': { 'left': '', 'right': '' },
      "\ 'subseparator': { 'left': '', 'right': '' }
      "\ }
"let g:Powerline_symbols = 'fancy'
" set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular


" Rainbow Parentheses 
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


""================     File Types    ===================""
""                                                      ""

" Auto-regenerate tags after saving files
au BufWritePost *.rb silent! !ctags -R &
au BufWritePost *.js silent! !ctags -R &

" file types
au BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown


let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

" Posix regular expressions for matching interesting items. Since this will
" be passed as an environment variable, no whitespace can exist in the options
" so [:space:] is used instead of normal whitespaces.
" Adapted from: https://gist.github.com/2901844
let s:ctags_opts = '
  \ --langdef=coffee
  \ --langmap=coffee:.coffee
  \ --regex-coffee=/(^|=[ \t])*class ([A-Za-z_][A-Za-z0-9_]+\.)*([A-Za-z_][A-Za-z0-9_]+)( extends ([A-Za-z][A-Za-z0-9_.]*)+)?$/\3/c,class/
  \ --regex-coffee=/^[ \t]*(module\.)?(exports\.)?@?(([A-Za-z][A-Za-z0-9_.]*)+):.*[-=]>.*$/\3/m,method/
  \ --regex-coffee=/^[ \t]*(module\.)?(exports\.)?(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=.*[-=]>.*$/\3/f,function/
  \ --regex-coffee=/^[ \t]*(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=[^->\n]*$/\1/v,variable/
  \ --regex-coffee=/^[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)[ \t]*=[^->\n]*$/\1/f,field/
  \ --regex-coffee=/^[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+):[^->\n]*$/\1/f,static field/
  \ --regex-coffee=/^[ \t]*(([A-Za-z][A-Za-z0-9_.]*)+):[^->\n]*$/\1/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?/\3/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){0}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){1}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){2}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){3}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){4}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){5}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){6}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){7}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){8}/\8/f,field/
  \ --regex-coffee=/((constructor|initialize):[ \t]*\()@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?(,[ \t]*@(([A-Za-z][A-Za-z0-9_.]*)+)([ \t]*=[ \t]*[^,)]+)?){9}/\8/f,field/'

let $CTAGS = substitute(s:ctags_opts, '\v\([nst]\)', '\\', 'g')



