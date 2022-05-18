require('telescope').setup({
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt_prefix = '  ',
        selection_caret = ' ',
        file_ignore_patterns = { '.pyc', '.png', '__init__.py' },
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'bottom',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    },
})

local opts = { silent = true, noremap = true }

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>fr', ':Telescope grep_string<cr>', opts)
vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>fs', ':Telescope current_buffer_fuzzy_find <cr>', opts)

local utils = require('utils')

utils.autocmd({
    group = 'Telescope_Theming',
    event = { 'VimEnter', 'ColorScheme' },
    commands = {
        'highlight TelescopeNormal        guibg=#1E1F29',
        'highlight TelescopeBorder        guibg=#1E1F29 guifg=#6E5991',
        'highlight TelescopePromptBorder  guibg=#1E1F29 guifg=#6E5991',
        'highlight TelescopeResultsBorder guibg=#1E1F29 guifg=#6E5991',
        'highlight TelescopePreviewBorder guibg=#1E1F29 guifg=#6E5991',
    },
})
