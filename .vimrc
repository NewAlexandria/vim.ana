" vimrc split-up into sections
" see `runtime` list at the bottom
"set encoding=utf8

" load the bundler
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

function! s:source_rc(path, ...) abort "{{{
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction"}}}

" Groups: rails, js, filesystem, experimental
let g:active_plugins = {
  \ 'filesystem': 1,
  \ 'experimental': 1
  \ }
  "\ 'js': 1,
  "\ 'rails': 1,

" Required:
set runtimepath+=~/.vim/bundle/dein.vim/repos/github.com/Shougo/dein.vim

let g:dein#install_progress_type = 'title'
" Required:
if dein#load_state('/Users/Zachary/.vim.ana/.vim/bundle')
  call dein#begin('/Users/Zachary/.vim.ana/.vim/bundle')

	" Let dein manage dein
	" Required:
	call dein#add('Shougo/dein.vim')

	"call dein#disable('tagbar')

	" Loaders
	call dein#add('xolox/vim-session')
	call dein#add('xolox/vim-misc')

	" IDE
	" also note that some IDE affordance provided by ctags-gem-rbenv integration
	"" Search / Indexing
	call dein#add('Shougo/unite.vim', {
    \ 'depends': ['neomru.vim'],
    \ 'on_source': ['denite.nvim']
    \ })
	call dein#add('Shougo/denite.nvim', {
    \ 'on_cmd': 'Denite'
    \ })

	call dein#add('Shougo/neomru.vim')
	call dein#add('tsukkee/unite-tag')
	call dein#add('majutsushi/tagbar')
	" call dein#add('Shougo/unite-outline')

	"" Async
  call dein#add('Shougo/vimproc.vim', {
    \ 'build' : 'make',
    \ 'on_source' : ['unite.vim']
    \ })

	"" Text & Completions
	call dein#add('ervandew/supertab', {'if': 0})
	call dein#add('kshenoy/vim-signature')
	call dein#add('bkad/CamelCaseMotion', {'if': "!empty('g:load_rails_plugins')"})
	call dein#add('osyo-manga/vim-over',              { 'on_cmd' : 'OverCommandLine' })

	call dein#add('Shougo/neocomplete.vim')
	call dein#add('Shougo/neosnippet')
	call dein#add('Shougo/neosnippet-snippets')

	" call dein#add('salsifis/vim-transpose')
	call dein#add('vim-scripts/swapcol.vim')

	"" Frameworks
	call dein#add('tpope/vim-rails',                  {'if': "has_key(g:active_plugins, 'rails')"})
	call dein#add('tpope/vim-bundler',                {'if': "has_key(g:active_plugins, 'rails')"})
	call dein#add('tpope/vim-rake',                   {'if': "has_key(g:active_plugins, 'rails')"})
	call dein#add('tpope/vim-projectionist',          {'if': "has_key(g:active_plugins, 'rails')"})
	call dein#add('tpope/vim-cucumber',               {'if': "has_key(g:active_plugins, 'rails')"})
	call dein#add('KabbAmine/vCoolor.vim',            {'if': "has_key(g:active_plugins, 'js')"})

	"" File System
	call dein#add('mileszs/ack.vim',                  )
	call dein#add('justinmk/vim-gtfo',                {'if': "has_key(g:active_plugins, 'filesystem')"})
	call dein#add('chrisbra/Recover.vim',             )
	call dein#add('mohitleo9/vim-fidget',             {
		\ 'if': "has_key(g:active_plugins, 'js')",
		\ 'build' : {
		\    'unix' : 'sudo npm install -g',
		\    'mac' : 'sudo npm install -g',
		\ }, })
	call dein#add('ludovicchabant/vim-gutentags',     {'if': "has_key(g:active_plugins, 'experimental')"})
	call dein#add('gioele/vim-autoswap')

	" Layout
	call dein#add('scrooloose/nerdtree',              {'if': "has_key(g:active_plugins, 'filesystem')"})
	call dein#add('jistr/vim-nerdtree-tabs',          {'if': "has_key(g:active_plugins, 'filesystem')"})
	call dein#add('dsimidzija/vim-nerdtree-ignore',   {'if': "has_key(g:active_plugins, 'filesystem')"})
	call dein#add('jeetsukumaran/vim-buffergator')
	call dein#add('bling/vim-airline')
	call dein#add('nathanaelkane/vim-indent-guides')

	"" Windowing Systems
	call dein#add('q335r49/microviche',               {'if': "has_key(g:active_plugins, 'experimental')"})
	call dein#add('mhinz/vim-startify')
	call dein#add('mtth/scratch.vim',                 {'if': "has_key(g:active_plugins, 'experimental')"})
	call dein#add('christoomey/vim-tmux-navigator',   {'if': "has_key(g:active_plugins, 'experimental')"})
	call dein#add('wellle/visual-split.vim')

	" VCS
	call dein#add('tpope/vim-fugitive')
	" call dein#add('chrisbra/changesPlugin')
	call dein#add('NewAlexandria/svnblame.vim')
	call dein#add('Xuyuanp/nerdtree-git-plugin',      {'if': "has_key(g:active_plugins, 'filesystem')"})

	" Formatting
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('tpope/vim-surround',               {
		\ 'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'},
		\ 'depends' : 'vim-repeat' })
	call dein#add('p0deje/vim-ruby-interpolation',    {'if': "has_key(g:active_plugins, 'rails')"})
	call dein#add('godlygeek/tabular',                {
		\ 'on_cmd' : [ 'Tab', 'Tabularize' ],
		\ 'augroup' : 'tabular' })
	call dein#add('jezcope/vim-align',                {'if': "has_key(g:active_plugins, 'experimental')"})


	" Syntax Colors
	call dein#add('altercation/vim-colors-solarized')
	call dein#add('kien/rainbow_parentheses.vim')
	call dein#add('tpope/vim-haml',                          {'if': 1})
	call dein#add('tpope/vim-markdown',                      {'if': 1})
	call dein#add('evanmiller/nginx-vim-syntax',             {'if': 1})
	call dein#add('pangloss/vim-javascript',                 {'if': "has_key(g:active_plugins, 'js')"})
	call dein#add('othree/javascript-libraries-syntax.vim',  {'if': "has_key(g:active_plugins, 'js')"})
	call dein#add('cakebaker/scss-syntax.vim')

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


let mapleader = '\'

let g:deoplete#enable_at_startup = 1
let g:init_with_blended_relative_absolute_number_line = 1

" if exists('g:loaded_neobundle')
"if neobundle#tap('neobundle.vim')
  " put the cursor on any file name and press `gf` to open
  call s:source_rc('.vim/plugin/File_types.rc.vim')
  call s:source_rc('.vim/plugin/Ide.rc.vim')
  call s:source_rc('.vim/plugin/Movements.rc.vim')
  call s:source_rc('.vim/plugin/Syntax.rc.vim')
  call s:source_rc('.vim/plugin/Text_formatting.rc.vim')
  call s:source_rc('.vim/plugin/Windowing.rc.vim')
"endif
