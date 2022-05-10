require('utils').autocmd({
    event = 'ColorScheme',
    group = 'Global_Theming',
    commands = {
        'highlight clear SignColumn',
        'highlight Normal                   guibg=none',
        'highlight NormalNC                 guibg=#16161D',
        'highlight NormalFloat              guibg=#1E1F29',
        'highlight FloatBorder              guibg=none guifg=#6E5991',
        'highlight Comment                  gui=italic,bold',
        'highlight VertSplit                guifg=#111215 guibg=#111215',
        'highlight EndOfBuffer              guibg=none',
        'highlight MsgArea                  guibg=#16161D guifg=#5C6370',
        'highlight SpellBad                 guifg=none guisp=#6A0C22 cterm=underdash gui=underdash',
        'highlight LspReferenceText         gui=bold,underline guibg=none',
        'highlight LspReferenceRead         gui=bold,underline guibg=none',
        'highlight LspReferenceWrite        gui=bold,underline guibg=none',

        'highlight Statement                gui=bold',
        'highlight TSKeywordFunction        gui=bold',
    },
})

vim.cmd('colorscheme onedarker')
