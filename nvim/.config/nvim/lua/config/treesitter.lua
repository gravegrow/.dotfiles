require('nvim-treesitter.configs').setup({
    ensure_installed = { 'python', 'json', 'lua', 'c', 'cpp', 'c_sharp' },
    sync_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    ignore_install = {},

    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
})
