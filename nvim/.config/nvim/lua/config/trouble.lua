local icons = require('colors-and-icons').icons

require('trouble').setup({
    signs = {
        error = icons.error,
        warning = icons.warning,
        hint = icons.hint,
        information = icons.info,
        other = icons.check,
    },
})

local trouble = require('trouble.providers.telescope')
local telescope = require('telescope')

telescope.setup({
    defaults = {
        mappings = {
            i = { ['<c-t>'] = trouble.open_with_trouble },
            n = { ['<c-t>'] = trouble.open_with_trouble },
        },
    },
})

vim.keymap.set({ 'n', 'v' }, '<leader>tt', ':TroubleToggle<cr>', { silent = true })
