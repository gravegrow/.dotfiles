local diagnostics_indicator = function(_, _, diagnostics_dict, _)
    local s = ' '
    for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and '  ' or (e == 'warning' and '  ' or '  ')
        s = s .. sym .. ':' .. n
    end
    return s
end

require('bufferline').setup({
    options = {
        indicator_icon = '▎ ',
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
        'hi BufferLineIndicatorSelected guibg=none guifg=#65AAEE',
        'hi BufferLineBufferSelected guibg=none gui=bold',
        'hi BufferLineErrorSelected gui=bold guifg=#B55765 ',
        'hi BufferLineErrorDiagnosticSelected gui=bold guifg=#B55766 ',
    },
}

utils.autocmd(opts)
