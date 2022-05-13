local _M = {}

function P(value)
    print(vim.inspect(value))
end

F = string.format

_M.autocmd = function(opts)
    local group = vim.api.nvim_create_augroup(opts.group, { clear = true })
    local cmd = vim.api.nvim_create_autocmd

    for _, command in pairs(opts.commands) do
        cmd(opts.event, { pattern = opts.pattern or '*', command = command, group = group })
    end
end

return _M
