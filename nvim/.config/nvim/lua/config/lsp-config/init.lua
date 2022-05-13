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

providers.sumneko_lua = {
    cmd = { sumneko_binary_path, '-E', sumneko_root_path .. '/main.lua' },
    settings = {
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
