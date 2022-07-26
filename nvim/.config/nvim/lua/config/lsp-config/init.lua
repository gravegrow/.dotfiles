require('config.lsp-config.lsp-ui').setup()
local handlers = require('config.lsp-config.lsp-handlers')
local installer = require('config.lsp-config.lsp-installer')

handlers.root_files = { '.luacheckrc' }

local servers = { 'pyright', 'sumneko_lua', 'jsonls', 'vimls', 'bashls', 'clangd' }
local providers = {}

for _, server in pairs(servers) do
    providers[server] = {}
end

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
table.insert(runtime_path, '/usr/share/awesome/lib/?.lua')
table.insert(runtime_path, '/usr/share/awesome/lib/?/init.lua')

providers.sumneko_lua = {
    cmd = { sumneko_binary_path, '-E', sumneko_root_path .. '/main.lua' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'awesome', 'client', 'root', 'screen', 'vim' },
            },
            workspace = {
                library = {
                    ['/usr/share/nvim/runtime/lua'] = true,
                    ['/usr/share/nvim/runtime/lua/lsp'] = true,
                    ['/usr/share/awesome/lib'] = true,
                },
            },
        },
    },
}

providers.pyright = {
    settings = {
        python = {
            analysis = {
                extraPaths = {
                    '/media/storage/dev/maya/devkit/2020_4/devkitBase/devkit/other/pymel/extras/completion/py',
                    '/media/storage/dev/maya/tools/',
                },
                diagnosticSeverityOverrides = {
                    reportGeneralTypeIssues = 'none',
                    reportOptionalCall = 'none',
                },
            },
        },
    },
}

installer.setup({ ensure_installed = servers })
for _, server in pairs(servers) do
    require('lspconfig')[server].setup({
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
        root_dir = handlers.root_dir,

        cmd = providers[server].cmd,
        settings = providers[server].settings,
    })
end
