local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local handlers = require('config.lsp-config.lsp-handlers')

null_ls.setup({
    sources = {
        formatting.stylua.with({
            extra_args = { '--indent-type', 'spaces', '--quote-style', 'AutoPreferSingle' },
        }),

        diagnostics.flake8.with({
            extra_args = { '--ignore-errors', 'F821' },
        }),

        diagnostics.pylint.with({
            extra_args = { '--disable', 'C0114,C0115,C0116,R0903,E0401,W0611,W0613' },
        }),

        formatting.black.with({ extra_args = '--fast' }),
        formatting.isort.with({}),
    },
    root_dir = handlers.root_dir,
})
