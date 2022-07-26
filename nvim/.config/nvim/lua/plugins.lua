local packer = require('config/packer')

local function config(name)
    return string.format('require("config/%s")', name)
end

packer.startup({
    function(use)
        use('wbthomason/packer.nvim')
        use('tpope/vim-surround')
        use('tpope/vim-fugitive')
        use('kyazdani42/nvim-web-devicons')

        use({ 'LunarVim/onedarker.nvim', commit = 'b00dd21', config = config('theming') })
        use({ 'akinsho/bufferline.nvim', config = config('bufferline') })
        use({ 'nvim-lualine/lualine.nvim', config = config('lualine') })

        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = config('treesitter') })

        use('nvim-lua/plenary.nvim')
        use({ 'nvim-telescope/telescope.nvim', config = config('telescope') })

        use({ 'ThePrimeagen/refactoring.nvim', config = config('refactor') })

        use({ 'ahmedkhalf/project.nvim', config = config('project') })
        use({ 'folke/trouble.nvim', config = config('trouble') })

        use({
            'neovim/nvim-lspconfig',
            requires = { 'williamboman/nvim-lsp-installer', 'jose-elias-alvarez/null-ls.nvim' },
            config = config('lsp-config'),
        })

        use({ 'jose-elias-alvarez/null-ls.nvim', config = config('null-ls') })

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
                use('lukas-reineke/cmp-rg'),
                use({ 'tzachar/cmp-tabnine', run = './install.sh' }),
            },
            config = config('cmp'),
        })

        use({ 'windwp/nvim-autopairs', config = config('autopairs') })
        use({ 'numToStr/Comment.nvim', config = config('comment') })
        use({ 'junegunn/vim-easy-align', config = config('easy-align') })

        use({ 'akinsho/toggleterm.nvim', tag = 'v2.*', config = config('toggleterm') })

        use({ 'RRethy/vim-hexokinase', run = 'make hexokinase', config = config('hexokinase') })

        use({ '/media/storage/dev/maya/tools/vim-JakeSender', config = config('maya-log') })

        use({
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
            config = config('nvim-tree'),
        })

        packer.bootstrap_sync()
    end,
})
