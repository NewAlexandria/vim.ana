""===================     IDE     ======================""
""                                                      ""

set cmdheight=2
set history=50
set showmatch
set number
set cursorline

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" Diff in gutter
let g:changes_autocmd=1
let g:changes_respect_other_signs = 1
nnoremap <leader>d :CL<cr>

" Blame gutter
map <leader>s :call SvnBlame()<CR>

" Sessions
let g:session_autosave = 'no'
let g:gtfo#terminals = { 'mac' : 'iterm' }

