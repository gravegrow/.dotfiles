local telescope = require('telescope')
telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>e', ':Telescope file_browser<cr>', { noremap = true, silent = true })
