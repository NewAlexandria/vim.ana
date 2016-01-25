""===================     IDE     ======================""
""                                                      ""

"let g:python_host_prog '/usr/bin/python2.7'



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

nnoremap <space>c :w !pbcopy
vnoremap <space>c :w !pbcopy
nnoremap <space>v :r !pbpaste
vnoremap <space>v :r !pbpaste

" Color Finders
"" For web  color insertion
nnoremap <space>cw :VCoolor<cr>     
"" For rgb  color insertion
nnoremap <space>cr :VCoolIns r<cr>  
"" For hsl  color insertion
nnoremap <space>ch :VCoolIns h<cr>  
"" For rgba color insertion
nnoremap <space>ca :VCoolIns ra<cr> 

" Add the pry debug line with \bp (or <Space>bp, if you did: map <Space> <Leader> )
map <Leader>dd obinding.pry<esc>:w<cr>
"map <Leader>dd obinding.pry if Rails.env.development? || Rails.env.test?<esc>:w<cr>
map <Leader>df /binding<cr>:noh<cr>

" TMUX adjustments
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif
"" TMUX navigator with NeoVim
"infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
"tic $TERM.ti

""" https://github.com/christoomey/vim-tmux-navigator#vim-1
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


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

