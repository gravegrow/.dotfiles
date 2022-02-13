Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

lua << EOF
function telescope_config()
    local telescope = require('telescope')
    telescope.setup {}
    telescope.load_extension('fzf')
end
EOF

augroup telescope_config
    autocmd!
    autocmd User PlugLoaded lua telescope_config()
augroup end
