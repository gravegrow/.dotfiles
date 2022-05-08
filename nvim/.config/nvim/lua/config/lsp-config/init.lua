local handlers = require('config.lsp-config.lsp-handlers')

require('lspconfig').pyright.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

require('lspconfig').jsonls.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
})

require('lspconfig').sumneko_lua.setup({
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'awesome', 'client', 'root', 'screen', 'vim' } },
            workspace = { library = '/usr/share/awesome/lib', vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
        },
    },
})
