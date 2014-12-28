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

fu! g:LeaderMap()
  let lrx='grep -R \<[lL]eader\> .vimrc .vim/plugin/*.vim | perl -pe "s/\.vim\/plugin\/(.+)\.rc.vim:.+<[lL]eader>(.+)/\1 Leader \2/" | sort | uniq'
  let uhd='echo -e "\n====== Unite =======\n"'
  let urx='grep -R space.*Unite     .vimrc .vim/plugin/*.vim | grep -v let | perl -pe "s/[:0-9]*\.vim\/plugin\/(.+)\.rc.vim:.+<space>(.+)/\1 Unite \2/" | sort'
  exec ":tabnew | r ! (".lrx." && ".uhd." && ".urx.")"
  exec ":tab %s/^[a-zA-Z_.:]*/\\=printf('%-15s', submatch(0))"
endfunc
nnoremap <leader>L :call g:LeaderMap()<cr>
nnoremap <leader>l :tabclose!<cr>

