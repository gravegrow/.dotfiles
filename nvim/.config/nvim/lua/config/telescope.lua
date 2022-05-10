require('telescope').setup({
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt_prefix = '  ',
        selection_caret = ' ',
    },
})

vim.keymap.set({ 'n' }, '<leader>ff', ':Telescope find_files<cr>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>fr', ':Telescope grep_string<cr>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>fd', ':Telescope diagnostics<cr>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>fb', ':Telescope buffers<cr>', { silent = true })
vim.keymap.set(
    { 'n' },
    '<leader>fs',
    ':Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>',
    { silent = true }
)

local utils = require('utils')
local opts = {
    group = 'Telescope_Theming',
    event = { 'VimEnter', 'ColorScheme' },
    commands = {
        'highlight TelescopeNormal        guibg=#1E1F29',
        'highlight TelescopeBorder        guibg=#1E1F29 guifg=#6E5991',
        'highlight TelescopePromptBorder  guibg=#1E1F29 guifg=#6E5991',
        'highlight TelescopeResultsBorder guibg=#1E1F29 guifg=#6E5991',
        'highlight TelescopePreviewBorder guibg=#1E1F29 guifg=#6E5991',
    },
}

utils.autocmd(opts)
