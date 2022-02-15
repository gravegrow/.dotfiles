Plug 'lewis6991/gitsigns.nvim'

augroup gitsigns
    autocmd!
    autocmd User PlugLoaded lua require('gitsigns').setup {}
augroup end
