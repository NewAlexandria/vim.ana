""================     Movements     ===================""
""                                                      ""

"enjoy an immediate quit without reviewing unread buffers
map :Q :qa
map :wq :xa
map j 5gj
map k 5gk

"map gt :tabnext<cr>
"map gT :tabprevious<cr>
map gb :bnext<cr>
map gB :bprevious<cr>
map <Leader>] :bnext<cr>
map <Leader>[ :bprevious<cr>
map <Leader>} :blast<cr>
map <Leader>{ :bfirst<cr>

map nd /[<=>]\{7\}<cr>

""" Ruby/JS Movements
" put the curson on the name of the function that you are currently in
"map gd :?\(def\|function\) <cr>:noh<cr>ee
map gdd :?def <cr>:noh<cr>ee
map gdf :?function <cr>:noh<cr>ee

map <Leader>n :NERDTreeFocus<cr>
map <Leader>nf :NERDTreeFind<cr>
map <Leader>b :BuffergatorOpen<cr>
map <Leader>v :wincmd b<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


""================     Navigations     ===================""
""                                                      ""

""  MovingThroughCamelCaseWords
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
"inoremap <silent> <C-Left>  <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
"inoremap <silent> <C-Right> <C-o>:cal search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

""  Find and show results in a QuickfixList
nnoremap <silent> <space><Up> :cn<CR>
nnoremap <silent> <space><Down> :cp<CR>
nnoremap <silent> <space><Right> :cnf<CR>
nnoremap <silent> <space><Left> :cpf<CR>


" unite navigations
"nnoremap <space>p :<C-u>Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async<cr>
nnoremap <space>p :<C-u>Unite -no-split -buffer-name=files   -start-insert buffer file_rec/async:!<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>? :execute 'Unite grep:.::' . expand("<cword>") . ' -auto-preview'<CR>
nnoremap <space>' :execute 'Unite grep:.::' . expand("<cword>") . ' -default-action=above -auto-preview'<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <space>t :Unite -start-insert tag<cr>
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
nnoremap <space>u :<C-u>Unite -no-split -buffer-name=buffers  buffer<cr>
nnoremap <space>b :Unite grep:$buffers<cr>
nnoremap <space>B :execute 'Unite grep:$buffers::' . expand("<cword>") . '  -start-insert'<cr>
"nnoremap <space>o :Unite -start-insert -vertical -winwidth=50 -direction=belowright outline<cr>
map <silent> <space>o :TagbarOpen fj<cr>

let g:unite_source_file_rec_max_cache_files = 50000
"call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


