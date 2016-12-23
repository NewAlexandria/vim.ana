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

nnoremap <silent> <Leader><Up>    :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader><Down>  :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader><Right> :exe "vertical resize +6"<CR>
nnoremap <silent> <Leader><Left>  :exe "vertical resize -6"<CR>


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
" creating a buffer listing 'NERD_tree_1' due to focus issues
if has('autocmd')
  autocmd VimEnter * NERDTreeFocus
  autocmd VimEnter * exe "vertical resize 40"
  autocmd VimEnter * BuffergatorOpen
  autocmd VimEnter * exe "resize 15"
  autocmd VimEnter * let g:buffergator_autoupdate=1
  autocmd VimEnter * wincmd w
  autocmd VimEnter * nested :call tagbar#autoopen(0)
endif


"" Buffer Navigation
" Toggle left sidebar: NERDTree and BufferGator
" test per http://justmao.name/life/integrate-nerdtree-and-buffergator/
let g:l_sidebar_toggle = 0
fu! LSidebarToggle()
  let b = bufnr("%")
  execute "NERDTreeToggle | BuffergatorToggle" 

  if(g:l_sidebar_toggle == 0)
    "execute "call Tagbar#autoopen"
    execute "call g:ToggleRNuMode()"
    execute "set nonumber!"
    execute ( bufwinnr(b) . "wincmd w" )
    let g:l_sidebar_toggle = 1
  else
    execute ( bufwinnr(b) . "wincmd w" )
    execute "set nonumber!"
    execute "call g:ToggleRNuMode()"
    let g:l_sidebar_toggle = 0
  endif
endf
map  <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>
map! <silent> <Leader>w  <esc>:call LSidebarToggle()<cr>

