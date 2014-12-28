""================  Syntax Coloring  ===================""
""                                                      ""

" Color formatting guide:
" http://misc.flogisoft.com/bash/tip_colors_and_formatting
" highlight ColorColumn ctermbg=234 guibg=#2c2d27
"highlight ColorColumn ctermbg=234 guibg=#1c1d17
let colorcolumn="80,".join(range(120,999),",")
syntax enable
set background=dark
colorscheme solarized
let g:airline_theme = 'base16'

"" Indent Guides
set ts=2 sw=2 et
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 3
"let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#011C22 ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#022B34 ctermbg=8


let g:solarized_italic     = 1
let g:solarized_termcolors = 256
"let g:solarized_termtrans  = 1
let g:solarized_contrast = 'high'

set guifont=Source\ Code\ Pro\ for\ Powerline
set laststatus=2
let g:airline_powerline_fonts = 1


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

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

