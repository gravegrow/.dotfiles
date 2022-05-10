vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_footer = { '' }
vim.g.dashboard_custom_section = {
    a = { description = { '  Recent projects' }, command = ':Telescope projects' },
    b = { description = { '  Plugins        ' }, command = ':e ~/.dotfiles/nvim/.config/nvim/lua/plugins.lua' },
}

vim.g.dashboard_custom_header = {}
