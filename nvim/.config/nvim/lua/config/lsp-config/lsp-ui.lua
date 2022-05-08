local _M = {}

_M.hover_higlight = function()
    local group = vim.api.nvim_create_augroup('HoverHighlighGroup', { clear = true })
    local autocmd = vim.api.nvim_create_autocmd
    autocmd('CursorHold', { pattern = '<buffer>', command = 'lua vim.lsp.buf.document_highlight()', group = group })
    autocmd('CursorMoved', { pattern = '<buffer>', command = 'lua vim.lsp.buf.clear_references()', group = group })
end

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

    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return _M
