local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

vim.o.completeopt = 'menuone,longest,preview'
cmp.setup({
    experimental = {
        ghost_text = true,
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = lspkind.cmp_format({
            mode = 'symbol',
            menu = {
                nvim_lsp = '[LSP]',
                nvim_lua = '[API]',
                buffer = '[BUFFER]',
                luasnip = '[SNIPPET]',
                path = '[PATH]',
            },
            symbol_map = {
                Class = ' ',
                Color = ' ',
                Constant = 'ﲀ ',
                Constructor = ' ',
                Enum = '練',
                EnumMember = ' ',
                Event = ' ',
                Field = ' ',
                File = '',
                Folder = ' ',
                Function = ' ',
                Interface = 'ﰮ ',
                Keyword = ' ',
                Method = ' ',
                Module = ' ',
                Operator = '',
                Property = ' ',
                Reference = ' ',
                Snippet = ' ',
                Struct = ' ',
                Text = ' ',
                TypeParameter = ' ',
                Unit = '塞',
                Value = ' ',
                Variable = ' ',
            },
        }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        -- ['<CR>'] = cmp.mapping.confirm({
        --     behavior = cmp.ConfirmBehavior.Replace,
        --     select = false,
        -- }),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        -- { name = 'buffer' },
        { name = 'luasnip' },
    },
})

luasnip.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
})

require('luasnip.loaders.from_vscode').lazy_load()
