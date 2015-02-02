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

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" uses Vim >= 7.4.338
set breakindent
set showbreak=➣➣\
if has('autocmd')
  augroup wrapping_types
    autocmd BufNewFile,BufRead *.feature set nowrap
    autocmd BufNewFile,BufRead *.js set wrap
    autocmd BufNewFile,BufRead *.rb set wrap
    autocmd BufNewFile,BufRead *.md set wrap
  augroup END
endif
set nolist wrap linebreak breakat&vim

"" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase    " searches are case insensitive...
set smartcase     " ... unless they contain at least one capital letter
set infercase     " Infer the current case in insert completion
map <Leader>\ :noh<cr>
runtime macros/matchit.vim

set wildmenu
set wildmode=list:longest,full

" Whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>R :set nolist!<CR>
" remove trailing whitespaces
nnoremap RR :%s/\s\+$//e<CR>

"" Variable replacement, per http://stackoverflow.com/a/597932/263858
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>


"" Modes
nnoremap <C-i> :set invpaste paste?<CR>
set pastetoggle=<F2>
call togglebg#map("<F5>")
set showmode
"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv


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

