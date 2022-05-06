require('project_nvim').setup({
    manual_mode = false,
    patterns = { '.luacheckrc', '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },
    exclude_dirs = { '~/.dotfiles' },
    show_hidden = false,
    datapath = vim.fn.stdpath('data'),
})

local ts = require('telescope')
ts.load_extension('projects')

vim.keymap.set({ 'n', 'v' }, '<leader>P', ':Telescope projects<cr>', { silent = true })
