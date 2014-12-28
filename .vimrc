" vimrc split-up into sections
" by hijacking the .vim/plugin directory

" [ 1]   .vim/plugin/File_types.rc.vim
" [ 2]   .vim/plugin/Ide.rc.vim
" [ 3]   .vim/plugin/Movements.rc.vim
" [ 3]   .vim/plugin/Syntax.rc.vim
" [ 4]   .vim/plugin/Text_formatting.rc.vim
" [ 5]   .vim/plugin/Windowing.rc.vim

" load the bundler
call pathogen#infect()

let mapleader = '\'

let g:init_with_blended_relative_absolute_number_line = 1

