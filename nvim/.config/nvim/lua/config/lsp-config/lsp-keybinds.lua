local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'g[', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local rename_command = '<cmd>lua vim.lsp.buf.rename()<CR>'

local function setup(buffer)
    vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(buffer, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap(buffer, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap(buffer, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap(buffer, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap(buffer, 'n', '<a-K>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap(buffer, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    keymap(buffer, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    keymap(buffer, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    keymap(buffer, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap(buffer, 'n', '<leader>rn', rename_command, opts)
    keymap(buffer, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap(buffer, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap(buffer, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

return setup
