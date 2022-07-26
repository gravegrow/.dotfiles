local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'g[', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local function setup(buffer)
    vim.api.nvim_buf_set_option(buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    opts.buffer = buffer
    local keymap = vim.keymap.set
    keymap('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap('n', 'gd', vim.lsp.buf.definition, opts)
    keymap('n', 'K', vim.lsp.buf.hover, opts)
    keymap('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap('n', '<a-K>', vim.lsp.buf.signature_help, opts)
    keymap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    keymap('n', 'gr', vim.lsp.buf.references, opts)
    keymap('n', '<leader>f', vim.lsp.buf.formatting, opts)
end

return setup
