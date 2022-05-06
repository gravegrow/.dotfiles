local _M = {}

_M.autocmd = function(opts)
    local group = vim.api.nvim_create_augroup(opts.group, { clear = true })
    local cmd = vim.api.nvim_create_autocmd

    for _, command in pairs(opts.commands) do
        cmd(opts.event, { pattern = '*' or opts.pattern, command = command, group = group })
    end
end

return _M
