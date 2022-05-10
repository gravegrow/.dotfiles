require('config.lsp-config.lsp-ui').setup()

local _M = {}
local keybinds = require('config.lsp-config.lsp-keybinds')

local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', { command = 'lua vim.lsp.buf.formatting_sync()', group = group })

local hover_higlight = function()
    local autocmd = vim.api.nvim_create_autocmd
    autocmd('CursorHold', { pattern = '<buffer>', command = 'lua vim.lsp.buf.document_highlight()', group = group })
    autocmd('CursorMoved', { pattern = '<buffer>', command = 'lua vim.lsp.buf.clear_references()', group = group })
end

_M.on_attach = function(client, buffer)
    keybinds(buffer)

    if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end

    if client.name ~= 'jsonls' then
        hover_higlight()
    end
end

_M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

return _M
