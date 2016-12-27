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

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


let mapleader = '\'

let g:init_with_blended_relative_absolute_number_line = 1

" put the cursor on any file name and press `gf` to open
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/'.'.vim/plugin/File_types.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/'.'.vim/plugin/Ide.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/'.'.vim/plugin/Movements.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/'.'.vim/plugin/Syntax.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/'.'.vim/plugin/Text_formatting.rc.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/'.'.vim/plugin/Windowing.rc.vim'

