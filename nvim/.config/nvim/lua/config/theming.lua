-- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=Red
-- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=Orange
-- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=LightBlue
-- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=LightGrey

local utils = require('utils')
local opts = {
    event = 'ColorScheme',
    group = 'Global_Theming',
    commands = {
        'highlight clear SignColumn',
        'highlight Normal                   guibg=none',
        'highlight NormalNC                 guibg=#16161D',
        'highlight NormalFloat              guibg=#1E1F29',
        'highlight StatusLine               guifg=#111215 guifg=#111215',
        'highlight StatusLineNC             guifg=#111215 guifg=#111215',
        'highlight FloatBorder              guibg=#1E1F29 guifg=#6E5991',
        'highlight Comment                  gui=italic,bold',
        'highlight VertSplit                guifg=#111215 guibg=#111215',
        'highlight EndOfBuffer              guibg=none',
        'highlight MsgArea                  guibg=#16161D guifg=#8F95A1',
        'highlight DiagnosticUnderlineWarn  cterm=underdash gui=underdash',
        'highlight DiagnosticUnderlineError cterm=underdash gui=underdash',
        'highlight SpellBad                 guifg=none guisp=#6A0C22 cterm=underdash gui=underdash',
    },
}

utils.autocmd(opts)
vim.cmd('colorscheme onedarker')
