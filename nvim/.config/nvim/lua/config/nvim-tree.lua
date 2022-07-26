local colors = require('colors-and-icons').colors

require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    view = { adaptive_size = true },
    renderer = {
        group_empty = true,
        icons = { show = { git = false } },
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle <cr>', { silent = true, noremap = true })
vim.cmd(Format('hi NvimTreeNormal guibg=%s', 'none'))
vim.cmd(Format('hi NvimTreeWinSeparator guibg=%s guifg=%s', 'none', colors.black))
