func! myspacevim#before() abort
  let g:neomake_enabled_c_makers = ['clang']
  set t_8f=^[[38;2;%lu;%lu;%lum
  set t_8b=^[[48;2;%lu;%lu;%lum

  " call SpaceVim#custom#SPC('nnoremap', ['f', 't'], 'echom "hello world"', 'test custom SPC', 1)

  call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
  call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)


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
