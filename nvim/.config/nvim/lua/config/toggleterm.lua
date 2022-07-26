require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'float',
    highlights = {
        FloatBorder = { guifg = require('colors-and-icons').colors.border, guibg = 'none' },
    },
})

local terminal = require('toggleterm.terminal').Terminal
local lazygit = terminal:new({ cmd = 'lazygit', hidden = true })
local ranger = terminal:new({ cmd = 'ranger', hidden = true })

local lazygit_toggle = function()
    lazygit:toggle()
end

local ranger_toggle = function()
    ranger:toggle()
end

vim.keymap.set('n', '<c-g>', lazygit_toggle, { noremap = true, silent = true })
vim.keymap.set('n', '<c-e>', ranger_toggle, { noremap = true, silent = true })
