local _M = {}
local icons = require('colors-and-icons').icons

local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

_M.setup = function()
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
    })

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = border,
            source = 'always',
            header = '',
            prefix = '',
            format = function(d)
                local t = vim.deepcopy(d)
                local code = d.code or (d.user_data and d.user_data.lsp.code)
                if code then
                    t.message = string.format('%s [%s]', t.message, code):gsub('1. ', '')
                end
                return t.message
            end,
        },
    })
    local signs = { Error = icons.error, Warn = icons.warning, Hint = icons.hint, Info = icons.info }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

local colors = require('colors-and-icons').colors
require('utils').autocmd({
    group = 'lsp_theming',
    event = { 'VimEnter', 'ColorScheme' },
    commands = {
        string.format('hi DiagnosticError           guifg=%s', colors.red),
        string.format('hi DiagnosticWarn            guifg=%s', colors.orange),
        string.format('hi DiagnosticInfo            guifg=%s', colors.blue),
        string.format('hi DiagnosticHint            guifg=%s', colors.blue),

        string.format('hi DiagnosticUnderlineError  gui=bold guibg=%s guifg=%s', colors.bg, 'Red'),
        string.format('hi DiagnosticUnderlineWarn   gui=bold guibg=%s guifg=%s', colors.bg, 'Orange'),
        string.format('hi DiagnosticUnderlineInfo   gui=bold ', colors.dim_blue, colors.black),
        string.format('hi DiagnosticUnderlineHint   gui=bold guifg=%s', colors.fg, colors.blue),

        string.format('hi DiagnosticFloatingError   guifg=%s', colors.red),
        string.format('hi DiagnosticFloatingWarn    guifg=%s', colors.orange),
        string.format('hi DiagnosticFloatingInfo    guifg=%s', colors.blue),
        string.format('hi DiagnosticFloatingHint    guifg=%s', colors.blue),

        string.format('hi DiagnosticSignError       guifg=%s', colors.dim_red),
        string.format('hi DiagnosticSignWarn        guifg=%s', colors.dim_orange),
        string.format('hi DiagnosticSignInfo        guifg=%s', colors.dim_blue),
        string.format('hi DiagnosticSignHint        guifg=%s', colors.dim_blue),
    },
})

return _M
