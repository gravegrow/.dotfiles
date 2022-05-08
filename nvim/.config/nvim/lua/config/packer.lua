local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute('packadd packer.nvim')
end

require('utils').autocmd({
    group = 'packer_user_config',
    event = 'BufWritePost',
    pattern = 'plugins.lua',
    commands = { 'source <afile> | PackerCompile' },
})

local packer = require('packer')

require('packer').init({
    display = {
        open_fn = function()
            return require('packer.util').float({
                border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            })
        end,
    },
})

return packer
