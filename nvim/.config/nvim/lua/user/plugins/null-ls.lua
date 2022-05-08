local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.stylua.with({
            extra_args = { '--indent-type', 'spaces', '--quote-style', 'AutoPreferSingle' },
        }),
        -- require("null-ls").builtins.completion.spell,
        -- diagnostics.luacheck,
    },
})
