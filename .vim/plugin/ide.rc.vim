""===================     IDE     ======================""
""                                                      ""

" reopen buffer as sudo
cmap w!! w !sudo tee % >/dev/null


set cmdheight=2
set history=50
set showmatch
set number
set cursorline

set foldmethod=marker     " Enable folding by fold markers
set foldclose=all         " Autoclose folds, when moving out of them
set scrolljump=5          " Jump 5 lines when running out of the screen
set scrolloff=3           " Indicate jump out of the screen when 3 lines before end of the screen

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif


" embeds the absolute line number amid a relative number line
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
if(g:init_with_blended_relative_absolute_number_line == 1)
  call g:ToggleRNuMode()
endif

" Sessions
let g:session_autosave = 'no'
let g:gtfo#terminals = { 'mac' : 'iterm' }
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


"" Display all Leader and Unite mappings from $VIMRC
fu! g:LeaderMap()
  let lrx='grep -R \<[lL]eader\> .vimrc .vim/plugin/*.vim | perl -pe "s/\.vim\/plugin\/(.+)\.rc.vim:.+<[lL]eader>(.+)/\1 Leader \2/" | sort | uniq'
  let uhd='echo -e "\n====== Unite =======\n"'
  let urx='grep -R space.*Unite     .vimrc .vim/plugin/*.vim | grep -v let | perl -pe "s/[:0-9]*\.vim\/plugin\/(.+)\.rc.vim:.+<space>(.+)/\1 Unite \2/" | sort'
  exec ":tabnew | r ! (".lrx." && ".uhd." && ".urx.")"
  exec ":tab %s/^[a-zA-Z_.:]*/\\=printf('%-15s', submatch(0))"
endfunc
nnoremap <leader>L :call g:LeaderMap()<cr>
nnoremap <leader>l :q!<cr>:tabclose!<cr>


""======   Version Control   ========

" Diff in gutter
let g:changes_autocmd=1
let g:changes_respect_other_signs = 1
nnoremap <leader>d :CL<cr>

" Blame gutter
map <leader>s :call SvnBlame()<CR>

