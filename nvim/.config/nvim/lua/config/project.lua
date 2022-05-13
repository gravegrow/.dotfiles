require('project_nvim').setup({
    exclude_dirs = { '~/.dotfiles' },
    detection_methods = { 'lsp', 'pattern' },
})

require('telescope').load_extension('projects')

vim.keymap.set({ 'n', 'v' }, '<leader>P', ':Telescope projects<cr>', { silent = true })
