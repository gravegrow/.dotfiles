Plug 'glepnir/lspsaga.nvim'

lua << EOF

function config()
    local saga = require('lspsaga')
    saga.init_lsp_saga()
end

EOF

augroup saga
    autocmd!
    autocmd User PlugLoaded lua config()
    autocmd User PlugLoaded nnoremap <silent><leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
augroup end
