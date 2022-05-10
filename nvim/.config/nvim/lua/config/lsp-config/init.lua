local handlers = require('config.lsp-config.lsp-handlers')
local installer = require('config.lsp-config.lsp-installer')

local servers = { 'pyright', 'sumneko_lua', 'jsonls', 'vimls', 'bashls', 'clangd' }
local settings = {}
local cmd = {}

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

cmd.sumneko_lua = { sumneko_binary_path, '-E', sumneko_root_path .. '/main.lua' }
settings.sumneko_lua = {
    Lua = {
        runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
        diagnostics = { enable = true, globals = { 'awesome', 'client', 'root', 'screen', 'vim' } },
        workspace = {
            library = {
                '/usr/share/awesome/lib',
                vim.api.nvim_get_runtime_file('', true),
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            },
        },
        telemetry = { enable = false },
    },
}

settings.pyright = {}

installer.setup({ ensure_installed = servers })
for _, server in pairs(servers) do
    require('lspconfig')[server].setup({
        cmd = cmd[server],
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
        settings = settings[server],
    })
end
