" vimrc split-up into sections
" see `runtime` list at the bottom
"set encoding=utf8

" load the bundler
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Loaders
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc'

" IDE
" also note that some IDE affordance provided by ctags-gem-rbenv integration
"" Search / Indexing
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'
"" Async
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

"" Text & Completions
NeoBundle 'ervandew/supertab'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'henrik/vim-indexed-search'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'whatyouhide/vim-lengthmatters'


"" Frameworks
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'KabbAmine/vCoolor.vim'

"" File System
NeoBundle 'mileszs/ack.vim'
NeoBundle 'justinmk/vim-gtfo'
NeoBundle 'chrisbra/Recover.vim'
NeoBundle 'mohitleo9/vim-fidget',{
    \ 'build' : {
    \    'unix' : 'sudo npm install -g',
    \    'mac' : 'sudo npm install -g',
    \ },
\}
"NeoBundle 'ludovicchabant/vim-gutentags'
NeoBundle 'gioele/vim-autoswap'

" Layout
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'dsimidzija/vim-nerdtree-ignore'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'bling/vim-airline'
NeoBundle 'nathanaelkane/vim-indent-guides'

"" Windowing Systems
NeoBundle 'q335r49/microviche'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'wellle/visual-split.vim'

" VCS
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'chrisbra/changesPlugin'
NeoBundle 'NewAlexandria/svnblame.vim'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" Formatting
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'p0deje/vim-ruby-interpolation'
NeoBundle 'godlygeek/tabular'
NeoBundle 'jezcope/vim-align'


" Syntax Colors
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'cakebaker/scss-syntax.vim'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


let mapleader = '\'

let g:init_with_blended_relative_absolute_number_line = 1

" put the cursor on any file name and press `gf` to open
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/plugin/File_types.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/plugin/Ide.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/plugin/Movements.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/plugin/Syntax.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/plugin/Text_formatting.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/.vim/plugin/Windowing.rc.vim'

