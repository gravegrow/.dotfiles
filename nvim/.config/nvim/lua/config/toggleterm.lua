require('toggleterm').setup({
    open_mapping = [[<c-t>]],
    direction = 'float',
    higlights = {
        FloatBorder = { link = 'FloatBorder' },
    },
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

function _Lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<c-g>', '<cmd>lua _Lazygit_toggle()<CR>', { noremap = true, silent = true })
