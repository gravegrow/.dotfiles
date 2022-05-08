local packer = require('config/packer')

local function get_config(name)
    return string.format('require("config/%s")', name)
end

packer.startup({
    function(use)
        use('wbthomason/packer.nvim')
        use('tpope/vim-surround')
        use('tpope/vim-fugitive')
        use('kyazdani42/nvim-web-devicons')

        use({ 'LunarVim/onedarker.nvim', config = get_config('theming') })
        use({ 'akinsho/bufferline.nvim', tag = '*', config = get_config('bufferline') })
        use({ 'nvim-lualine/lualine.nvim', config = get_config('lualine') })

        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = get_config('treesitter') })

        use('nvim-lua/plenary.nvim')
        use({ 'nvim-telescope/telescope.nvim', config = get_config('telescope') })
        use({ 'nvim-telescope/telescope-file-browser.nvim', config = get_config('file-browser') })

        use({ 'ThePrimeagen/refactoring.nvim', config = get_config('refactor') })
        use({ 'ahmedkhalf/project.nvim', config = get_config('project') })
        use({ 'folke/trouble.nvim', config = get_config('trouble') })

        use({
            'neovim/nvim-lspconfig',
            requires = { 'williamboman/nvim-lsp-installer' },
            config = get_config('lsp-config'),
        })

        use({ 'jose-elias-alvarez/null-ls.nvim', config = get_config('null-ls') })

        use({
            'hrsh7th/nvim-cmp',
            requires = {
                use('hrsh7th/cmp-nvim-lsp'),
                use('hrsh7th/cmp-nvim-lsp-signature-help'),
                use('hrsh7th/cmp-buffer'),
                use('hrsh7th/cmp-path'),
                use('hrsh7th/cmp-nvim-lua'),
                use('saadparwaiz1/cmp_luasnip'),
                use('onsails/lspkind-nvim'),
                use('L3MON4D3/LuaSnip'),
                use('rafamadriz/friendly-snippets'),
                use({ 'tzachar/cmp-tabnine', run = './install.sh' }),
            },
            config = get_config('cmp'),
        })

        use({ 'windwp/nvim-autopairs', config = get_config('autopairs') })
        use({ 'numToStr/Comment.nvim', config = get_config('comment') })
        use({ 'junegunn/vim-easy-align' })
    end,
})
