local ts = require('telescope')
ts.setup({
    defaults = {
        borderchars = { '━', '┃', '━', '┃', '┏', '┓', '┛', '┗' },
        prompt_prefix = '  ',
        selection_caret = ' ',
    },
})

vim.keymap.set({ 'n', 'v' }, '<leader>ff', ':Telescope find_files<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>fd', ':Telescope diagnostics<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>fb', ':Telescope buffers<cr>', { silent = true })
vim.keymap.set(
    { 'n', 'v' },
    '<leader>fs',
    ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>',
    { silent = true }
)

local utils = require('user.utils')
local opts = {
    group = 'Telescope_Theming',
    event = 'ColorScheme',
    commands = {
        'highlight TelescopeBorder         guifg=#6E5991',
        'highlight TelescopePromptBorder   guifg=#6E5991',
        'highlight TelescopeResultsBorder  guifg=#6E5991',
        'highlight TelescopePreviewBorder  guifg=#6E5991',
    },
}

utils.autocmd(opts)
