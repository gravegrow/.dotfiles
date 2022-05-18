local lsp_util = require('lspconfig/util')
local keybinds = require('config.lsp-config.lsp-keybinds')

local group = vim.api.nvim_create_augroup('lsp_format_on_save', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', { command = 'lua vim.lsp.buf.formatting_sync()', group = group })

local hover_higlight = function(client, buffer)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false,
        })
        vim.api.nvim_clear_autocmds({
            buffer = buffer,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = buffer,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = buffer,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

local _M = {}

_M.on_attach = function(client, buffer)
    keybinds(buffer)
    hover_higlight(client, buffer)

    if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end
end

_M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

_M.root_files = {}
_M.root_dir = function(fname)
    return lsp_util.root_pattern(unpack(_M.root_files))(fname)
        or lsp_util.find_git_ancestor(fname)
        or lsp_util.path.dirname(fname)
end

return _M
