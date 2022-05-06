local installer = require('user.plugins.lsp-config.lsp-installer')
local keybinds = require('user.plugins.lsp-config.lsp-keybinds')
local ui = require('user.plugins.lsp-config.lsp-ui')

installer.setup({ ensure_installed = { 'pyright', 'sumneko_lua', 'json', 'vimls', 'bashls' } })
ui.setup()

local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', { command = 'lua vim.lsp.buf.formatting_sync()', group = group })

local on_attach = function(client, buffer)
    if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end

    ui.hover_higlight()
    keybinds(buffer)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require('lspconfig').sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'awesome', 'client', 'root', 'screen', 'vim' } },
            workspace = { library = '/usr/share/awesome/lib', vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
        },
    },
})
