local diagnostics_indicator = function(_, _, diagnostics_dict, _)
    local s = ' '
    for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and '  ' or (e == 'warning' and '  ' or ' ')
        s = s .. sym .. ':' .. n
    end
    return s
end

require('bufferline').setup({
    options = {
        modified_icon = '',
        indicator_icon = '▍',
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_tab_indicator = true,
        separator_style = 'thick',
        diagnostics_indicator = diagnostics_indicator,
    },
})

vim.keymap.set({ 'n', 'v' }, 'L', ':BufferLineCycleNext<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'H', ':BufferLineCyclePrev<cr>', { silent = true })

local utils = require('user.utils')
local opts = {
    event = 'ColorScheme',
    group = 'Bufferline_Theming',

    commands = {
        'hi BufferLineBackground                  gui=none guifg=#272931 guibg=#16161D',
        'hi BufferLineBufferSelected              guibg=none gui=bold guifg=#8F95A1',
        'hi BufferLineBufferVisible               gui=bold guifg=#1E1F29 guibg=#16161D',

        'hi BufferLineSeparator                   guibg=#111215 guifg=#111215',
        'hi BufferLineIndicatorSelected           guibg=none guifg=#65AAEE',

        'hi BufferLineErrorSelected               gui=bold guibg=none guifg=#B55765 ',
        'hi BufferLineErrorDiagnosticSelected     gui=bold guibg=none guifg=#B55766 ',

        'hi BufferLineHintSelected                gui=bold guibg=none guifg=#3F434F ',
        'hi BufferLineHintDiagnosticSelected      gui=bold guibg=none guifg=#3F434F',

        'hi BufferLineWarningSelected             gui=bold guibg=none guifg=#D19A66 ',
        'hi BufferLineWarningDiagnosticSelected   gui=bold guibg=none guifg=#D19A66',

        'hi BufferLineModified                    guifg=#4C5D47 guibg=#16161D',
        'hi BufferLineModifiedVisible             guifg=#4C5D47 guibg=#16161D',
        'hi BufferLineModifiedSelected            guifg=#98C379 guibg=none',
    },
}
utils.autocmd(opts)
