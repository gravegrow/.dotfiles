require('refactoring').setup({})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true, expr = false }
-- Remaps for the refactoring operations currently offered by the plugin
keymap('v', '<leader>re', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
keymap('v', '<leader>rf', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], opts)
keymap('v', '<leader>rv', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], opts)
keymap('v', '<leader>ri', [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

-- Extract block doesn't need visual mode
keymap('n', '<leader>rb', [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], opts)
keymap('n', '<leader>rbf', [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], opts)

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
keymap('n', '<leader>ri', [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

-- load refactoring Telescope extension
require('telescope').load_extension('refactoring')

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
    'v',
    '<leader>rr',
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
)
