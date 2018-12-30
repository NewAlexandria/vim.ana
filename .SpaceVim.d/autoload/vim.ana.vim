func! myspacevim#before() abort
  let g:neomake_enabled_c_makers = ['clang']

  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum

# ide
  nnoremap <space>c :w !pbcopy<cr>
  vnoremap <space>c :w !pbcopy<cr>
  nnoremap <space>v :r !pbpaste<cr>
  vnoremap <space>v :r !pbpaste<cr>


# movement

  map <Leader>] :bnext<cr>
  map <Leader>[ :bprevious<cr>
  map <Leader>} :blast<cr>
  map <Leader>{ :bfirst<cr>

  "enjoy an immediate quit without reviewing unread buffers
  map :Q :qa
  map :wq :xa
  map j 5gj
  map k 5gk
endf

func! myspacevim#after() abort
endf
