Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

augroup Airline
    autocmd!
    autocmd User PlugLoaded ++nested let g:airline_powerline_fonts = 1
    autocmd User PlugLoaded ++nested let g:airline#extensions#tabline#enabled = 1
    autocmd User PlugLoaded ++nested let g:airline_theme='one'
augroup end
