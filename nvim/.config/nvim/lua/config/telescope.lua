require('telescope').setup({
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt_prefix = '  ',
        selection_caret = ' ',
        file_ignore_patterns = { '.pyc', '.png' },
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
vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>fs', ':Telescope current_buffer_fuzzy_find layout_strategy=vertical<cr>', opts)

local utils = require('utils')

utils.autocmd({
    group = 'Telescope_Theming',
    event = { 'VimEnter', 'ColorScheme' },
    commands = {
        'highlight TelescopeNormal        guibg=none',
        'highlight TelescopeTitle         guifg=#C678DD',
        'highlight TelescopeBorder        guibg=none guifg=#6E5991',
        'highlight TelescopePromptBorder  guibg=none guifg=#6E5991',
        'highlight TelescopeResultsBorder guibg=none guifg=#6E5991',
        'highlight TelescopePreviewBorder guibg=none guifg=#6E5991',
    },
})
