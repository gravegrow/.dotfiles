Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }

augroup Theming
    autocmd!
    autocmd User PlugLoaded ++nested let g:one_allow_italics = 1
    autocmd User PlugLoaded ++nested colorscheme one
    autocmd User PlugLoaded ++nested hi Normal ctermbg=none guibg = none
    autocmd User PlugLoaded ++nested hi clear SignColumn

    autocmd User PlugLoaded ++nested hi DiagnosticError ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#854A59
    autocmd User PlugLoaded ++nested hi DiagnosticWarn  ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#5c5c5c
    autocmd User PlugLoaded ++nested hi DiagnosticInfo  ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#596344
    autocmd User PlugLoaded ++nested hi DiagnosticHint  ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#3c524a
augroup end



