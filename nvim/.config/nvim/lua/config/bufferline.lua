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
        separator_style = 'thin',
        diagnostics_indicator = function(_, level, _, _)
            return icons[level]
        end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left',
            },
        },
    },
})

local cycle = {
    next = function()
        require('bufferline').cycle(1)
    end,
    prev = function()
        require('bufferline').cycle(-1)
    end,
}

local function toggle_bufferline()
    if vim.o.showtabline ~= 0 then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
end

vim.keymap.set({ 'n', 'v' }, 'L', cycle.next, { silent = true })
vim.keymap.set({ 'n', 'v' }, 'H', cycle.prev, { silent = true })
vim.keymap.set({ 'n', 'v' }, '<a-w>', toggle_bufferline, { silent = true })

require('utils').autocmd({
    event = { 'VimEnter', 'ColorScheme' },
    group = 'Bufferline_Theming',

    commands = {
        Format('hi BufferLineBackground                gui=none guifg=%s guibg=%s', colors.fg, colors.dark_gray),
        Format('hi BufferLineBufferSelected            gui=bold guifg=%s guibg=none ', colors.normal),
        Format('hi BufferLineBufferVisible             gui=none guibg=%s', colors.dark_gray),

        Format('hi BufferLineSeparator                 guibg=%s guifg=%s', colors.separator, colors.separator),
        Format('hi BufferLineIndicatorSelected         guibg=none guifg=%s', colors.blue),
        Format('hi BufferLineIndicatorVisible          guibg=%s guifg=%s', colors.dark_gray, colors.dark_gray),

        Format('hi BufferLineErrorSelected             gui=bold guibg=%s guifg=%s', colors.bg, colors.red),
        Format('hi BufferLineErrorDiagnosticSelected   gui=bold guibg=%s guifg=%s', colors.bg, colors.red),
        Format('hi BufferLineError                     gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_red),
        Format('hi BufferLineErrorVisible              guibg=%s guifg=%s', colors.inactive, colors.fg),
        Format('hi BufferLineErrorDiagnostic           gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_red),
        Format('hi BufferLineErrorDiagnosticVisible    guibg=%s guifg=%s', colors.inactive, colors.fg),

        Format('hi BufferLineHintSelected              gui=bold guibg=%s guifg=%s', colors.bg, colors.normal),
        Format('hi BufferLineHintDiagnosticSelected    gui=bold guibg=%s guifg=%s', colors.bg, colors.blue),
        Format('hi BufferLineHint                      gui=bold guibg=%s guifg=%s', colors.inactive, colors.fg),
        Format('hi BufferLineHintVisible               guibg=%s guifg=%s', colors.inactive, colors.fg),
        Format('hi BufferLineHintDiagnostic            gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_blue),
        Format('hi BufferLineHintDiagnosticVisible     guibg=%s guifg=%s', colors.inactive, colors.fg),

        Format('hi BufferLineWarningSelected           gui=bold guibg=%s guifg=%s', colors.bg, colors.orange),
        Format('hi BufferLineWarningDiagnosticSelected gui=bold guibg=%s guifg=%s', colors.bg, colors.orange),
        Format('hi BufferLineWarning                   gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_orange),
        Format('hi BufferLineWarningVisible            guibg=%s guifg=%s', colors.inactive, colors.fg),
        Format('hi BufferLineWarningDiagnostic         gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_orange),
        Format('hi BufferLineWarningDiagnosticVisible  guibg=%s guifg=%s', colors.inactive, colors.fg),

        Format('hi BufferLineInfoSelected              gui=bold guibg=%s guifg=%s', colors.bg, colors.normal),
        Format('hi BufferLineInfoDiagnosticSelected    gui=bold guibg=%s guifg=%s', colors.bg, colors.blue),
        Format('hi BufferLineInfo                      gui=bold guibg=%s guifg=%s', colors.inactive, colors.fg),
        Format('hi BufferLineInfoVisible               guibg=%s guifg=%s', colors.inactive, colors.fg),
        Format('hi BufferLineInfoDiagnostic            gui=bold guibg=%s guifg=%s', colors.inactive, colors.dim_blue),
        Format('hi BufferLineInfoDiagnosticVisible     guibg=%s guifg=%s', colors.inactive, colors.fg),

        Format('hi BufferLineModified                  guifg=%s guibg=%s', colors.dim_green, colors.dark_gray),
        Format('hi BufferLineModifiedVisible           guifg=%s guibg=%s', colors.dim_green, colors.dark_gray),
        Format('hi BufferLineModifiedSelected          guifg=%s guibg=none', colors.green),
        Format('hi BufferLineFill                      guibg=%s', colors.black),
    },
})
