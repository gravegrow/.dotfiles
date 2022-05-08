require('trouble').setup({})

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
