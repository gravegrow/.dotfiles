local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local handlers = require('config.lsp-config.lsp-handlers')

local h = require('null-ls.helpers')

null_ls.setup({
    sources = {
        formatting.stylua.with({
            extra_args = { '--indent-type', 'spaces', '--quote-style', 'AutoPreferSingle' },
        }),

        diagnostics.flake8.with({
            extra_args = { '--ignore', 'D,F401,E302,E303,E999,F821,WPS306,WPS421,E800,WPS102' },
            on_output = h.diagnostics.from_pattern(
                [[:(%d+):(%d+): ((%u)%w+) (.*)]],
                { 'row', 'col', 'code', 'severity', 'message' },
                {
                    severities = {
                        E = h.diagnostics.severities['error'],
                        W = h.diagnostics.severities['warning'],
                        F = h.diagnostics.severities['information'],
                        D = h.diagnostics.severities['information'],
                        R = h.diagnostics.severities['warning'],
                        S = h.diagnostics.severities['warning'],
                        I = h.diagnostics.severities['warning'],
                        C = h.diagnostics.severities['warning'],
                        N = h.diagnostics.severities['warning'],
                        Q = h.diagnostics.severities['warning'],
                        P = h.diagnostics.severities['warning'],
                    },
                }
            ),
        }),

        formatting.black.with({
            extra_args = { '--line-length', '79' },
        }),
        formatting.isort.with({}),
    },
    root_dir = handlers.root_dir,
})
