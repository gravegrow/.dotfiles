local config = require('user.plugins.lsp-config.config')

require('lspconfig').pyright.setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
})

require('lspconfig').jsonls.setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
})

require('lspconfig').sumneko_lua.setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { 'awesome', 'client', 'root', 'screen', 'vim' } },
            workspace = { library = '/usr/share/awesome/lib', vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
        },
    },
})
