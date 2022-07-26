local map = function(mode, lh, rh)
    vim.keymap.set(mode, lh, rh, { silent = true })
end

vim.g.mapleader = ' '

map({ 'n', 'v' }, '<C-s>', ':w<cr>')
map('n', 'gf', ':edit <cfile><cr>')

map('v', 'p', '"_dP')

map('v', '<', '<gv')
map('v', '>', '>gv')

map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

map('n', '<A-k>', ':move .-2<CR>==')
map('n', '<A-j>', ':move .+1<CR>==')
