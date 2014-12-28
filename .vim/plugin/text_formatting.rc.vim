""===================  Text Stuff  =====================""
""                                                      ""

set tabstop=4
retab  " this will cause all existing tabs to be expanded
set ts=2
set shiftwidth=2
set autoindent
set expandtab
set nostartofline
let g:matchparen_insert_timeout=5
set encoding=utf8

" uses Vim >= 7.4.338
set breakindent
set showbreak=➣➣\ 
set nolist wrap linebreak breakat&vim

set wildmenu
set wildmode=list:longest,full
" remove trailing whitespaces
nnoremap RR :%s/\s\+$//e<CR>
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


" functions to toggle number mode
let g:toggle_rnu_mode = 0
function! g:ToggleRNuMode()
    if(g:toggle_rnu_mode == 1)
        set relativenumber!
        set number
        let g:toggle_rnu_mode = 0
    else
        set relativenumber
        set number
        let g:toggle_rnu_mode = 1
    endif
endfunc
nnoremap <leader>r :call g:ToggleRNuMode()<cr>

" Box character (turburul) hax
" https://bitbucket.org/atimholt/dot_files/src/default/vimrc
function! g:BoxCharacters()  
  :'<,'>s'r'┌'e   " This:
  :'<,'>s','┐'e    " r---—v-,
  :'<,'>s'’'┘'e    " |    | |
  :'<,'>s/'/┘/e    " >----+-<
  :'<,'>s'L'└'e    " |    | |
                   " >————+—<
  :'<,'>s'|'│'e    " |    | |
  :'<,'>s'-'─'e    " L----^—’
  :'<,'>s'—'─'e    "
  :'<,'>s'+'┼'e   " Becomes This:
                   " ┌────┬─┐
  :'<,'>s'\^'┴'e   " │    │ │
  :'<,'>s'>'├'e    " ├────┼─┤
  :'<,'>s'v'┬'e    " │    │ │
  :'<,'>s'T'┬'e    " ├────┼─┤
  :'<,'>s'<'┤'e    " │    │ │
endfunction        " └────┴─┘

" json format/beautifier
nnoremap =j :%!python -m json.tool<CR>

