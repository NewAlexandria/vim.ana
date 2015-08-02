" vimrc split-up into sections
" by hijacking the .vim/plugin directory

" [ 0]   .vim/plugin/Completions.rc.vim
" [ 1]   .vim/plugin/File_types.rc.vim
" [ 2]   .vim/plugin/Ide.rc.vim
" [ 3]   .vim/plugin/Movements.rc.vim
" [ 4]   .vim/plugin/Syntax.rc.vim
" [ 5]   .vim/plugin/Text_formatting.rc.vim
" [ 6]   .vim/plugin/Windowing.rc.vim

" load the bundler
call pathogen#infect()

let mapleader = '\'

let g:init_with_blended_relative_absolute_number_line = 1

