local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

--stylua: ignore start
local sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'rg' },
    { name = 'cmp_tabnine' },
}

local menu = {
    luasnip     = '[SNIPPET]',
    nvim_lsp    = '[LSP]',
    nvim_lua    = '[NVIM]',
    treesitter  = '[TREESITTER]',
    buffer      = '[BUFFER]',
    path        = '[PATH]',
    cmp_tabnine = '[TABNINE]',
    rg          = '[RIPGREP]',
}
--stylua: ignore end

cmp.setup({
    experimental = {
        ghost_text = true,
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = menu,
            -- symbol_map = symbol_map,
        }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            border = { '▍', ' ', ' ', ' ', ' ', ' ', '▍', '▍' }, -- { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            winhighlight = 'NormalNC:CmpNormal,FloatBorder:CmpBorder',
        },
        completion = {
            border = false,
            winhighlight = 'NormalNC:CmpNormal,FloatBorder:CmpBorder',
        },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.close()
                else
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                end
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
    sources = sources,
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

luasnip.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
})

require('luasnip.loaders.from_vscode').lazy_load()

require('utils').autocmd({
    group = 'cmp_theming',
    event = { 'VimEnter', 'ColorScheme' },
    commands = {
        'hi! CmpItemAbbrDeprecated   guibg=NONE gui=strikethrough guifg=#808080',
        'hi! CmpItemAbbrMatch        guibg=NONE guifg=#60ACEB gui=bold',
        'hi! CmpItemAbbrMatchFuzzy   guibg=NONE guifg=#60ACEB gui=bold',
        'hi! CmpItemKindVariable     guibg=NONE guifg=#9CDCFE',
        'hi! CmpItemKindInterface    guibg=NONE guifg=#9CDCFE',
        'hi! CmpItemKindText         guibg=NONE guifg=#9CDCFE',
        'hi! CmpItemKindFunction     guibg=NONE guifg=#C586C0',
        'hi! CmpItemKindMethod       guibg=NONE guifg=#C586C0',
        'hi! CmpItemKindKeyword      guibg=NONE guifg=#D4D4D4',
        'hi! CmpItemKindProperty     guibg=NONE guifg=#D4D4D4',
        'hi! CmpItemKindUnit         guibg=NONE guifg=#D4D4D4',
        'hi! CmpItemMenu             guifg=#383B45 gui=bold',
    },
})
