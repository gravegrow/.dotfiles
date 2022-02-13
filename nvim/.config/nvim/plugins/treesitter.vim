Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

lua << EOF
function treesitter_config()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup {
        highlight = {
            enable = true
        }
    }
end
EOF

augroup treesitter
    autocmd!
    autocmd User PlugLoaded lua treesitter_config()
augroup end
