""================  Syntax Coloring  ===================""
""                                                      ""

" Color formatting guide:
" http://misc.flogisoft.com/bash/tip_colors_and_formatting
let &colorcolumn="81,120"
highlight ColorColumn ctermbg=235 guibg=#2c2d27

syntax enable
set background=dark
"let g:airline_theme = 'base16'

let g:solarized_italic     = 1
let g:solarized_termcolors = 256
"let g:solarized_termtrans  = 1
let g:solarized_contrast = 'high'

set guifont=Fira\ Code
set laststatus=2
let g:airline_powerline_fonts = 1


"" Indent Guides
set ts=2 sw=2 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 3
"let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 10
if has('autocmd')
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#081F26 " ctermbg=darkgrey  #202020 
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#00151B ctermbg=black     " #171717
endif

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" Rainbow Parentheses 
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

if has('autocmd')
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif

let g:used_javascript_libs = 'underscore,angularjs,jasmine,jquery'

colorscheme solarized
