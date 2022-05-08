local _M = {}
local installer = require('config.lsp-config.lsp-installer')
local keybinds = require('config.lsp-config.lsp-keybinds')
local ui = require('config.lsp-config.lsp-ui')

installer.setup({ ensure_installed = { 'pyright', 'sumneko_lua', 'json', 'vimls', 'bashls' } })
ui.setup()

local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', { command = 'lua vim.lsp.buf.formatting_sync()', group = group })

_M.on_attach = function(client, buffer)
    if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end

    ui.hover_higlight()
    keybinds(buffer)
end

_M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

return _M
