local icons = require('colors-and-icons').icons
local colors = require('colors-and-icons').colors

require('bufferline').setup({
    options = {
        modified_icon = icons.mark,
        indicator_icon = '▍',
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_tab_indicator = true,
        separator_style = 'thick',
        diagnostics_indicator = function(_, level, _, _)
            return icons[level]
        end,
    },
})

vim.keymap.set({ 'n', 'v' }, 'L', ':BufferLineCycleNext<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'H', ':BufferLineCyclePrev<cr>', { silent = true })

require('utils').autocmd({
    event = { 'VimEnter', 'ColorScheme' },
    group = 'Bufferline_Theming',

    commands = {
        F('hi BufferLineBackground                gui=none guifg=%s guibg=%s', colors.fg, colors.dark_gray),
        F('hi BufferLineBufferSelected            gui=bold guifg=%s guibg=none ', colors.normal),
        F('hi BufferLineBufferVisible             gui=none guibg=%s', colors.dark_gray),

        F('hi BufferLineSeparator                 guibg=%s guifg=%s', colors.separator, colors.separator),
        F('hi BufferLineIndicatorSelected         guibg=none guifg=%s', colors.blue),
        F('hi BufferLineIndicatorVisible          guibg=%s guifg=%s', colors.dark_gray, colors.dark_gray),

        F('hi BufferLineErrorSelected             gui=bold guibg=%s guifg=%s', colors.bg, colors.red),
        F('hi BufferLineErrorDiagnosticSelected   gui=bold guibg=%s guifg=%s', colors.bg, colors.red),
        F('hi BufferLineError                     gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_red),
        F('hi BufferLineErrorDiagnostic           gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_red),

        F('hi BufferLineHintSelected              gui=bold guibg=%s guifg=%s', colors.bg, colors.normal),
        F('hi BufferLineHintDiagnosticSelected    gui=bold guibg=%s guifg=%s', colors.bg, colors.blue),
        F('hi BufferLineHint                      gui=bold guibg=%s guifg=%s', colors.inactive, colors.fg),
        F('hi BufferLineHintDiagnostic            gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_blue),

        F('hi BufferLineWarningSelected           gui=bold guibg=%s guifg=%s', colors.bg, colors.orange),
        F('hi BufferLineWarningDiagnosticSelected gui=bold guibg=%s guifg=%s', colors.bg, colors.orange),
        F('hi BufferLineWarning                   gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_orange),
        F('hi BufferLineWarningDiagnostic         gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_orange),

        F('hi BufferLineInfoSelected              gui=bold guibg=%s guifg=%s', colors.bg, colors.normal),
        F('hi BufferLineInfoDiagnosticSelected    gui=bold guibg=%s guifg=%s', colors.bg, colors.blue),
        F('hi BufferLineInfo                      gui=bold guibg=%s guifg=%s', colors.inactive, colors.fg),
        F('hi BufferLineInfoDiagnostic            gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_blue),

        F('hi BufferLineModified                  guifg=%s guibg=%s', colors.dim_green, colors.dark_gray),
        F('hi BufferLineModifiedVisible           guifg=%s guibg=%s', colors.dim_green, colors.dark_gray),
        F('hi BufferLineModifiedSelected          guifg=%s guibg=none', colors.green),
        F('hi BufferLineFill                      guibg=%s', colors.black),
    },
})
