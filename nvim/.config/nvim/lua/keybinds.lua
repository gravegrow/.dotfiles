local map = vim.keymap.set

vim.g.mapleader = ' '

map({ 'n', 'v' }, '<C-s>', '<cmd>w<cr>', { silent = true })
map('n', 'gf', ':edit <cfile><cr>', { silent = true })

map('v', 'p', '"_dP', { silent = true })

map('v', '<', '<gv', { silent = true })
map('v', '>', '>gv', { silent = true })

map('n', '<c-h>', '<c-w>h', { silent = true })
map('n', '<c-j>', '<c-w>j', { silent = true })
map('n', '<c-k>', '<c-w>k', { silent = true })
map('n', '<c-l>', '<c-w>l', { silent = true })

map('n', '<A-k>', ':move .-2<CR>==', { silent = true })
map('n', '<A-j>', ':move .+1<CR>==', { silent = true })
