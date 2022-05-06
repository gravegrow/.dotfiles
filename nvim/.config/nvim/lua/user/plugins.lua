local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
    bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup({
    function(use)
        use({ 'wbthomason/packer.nvim' })
        use({ 'tpope/vim-surround' })
        use({ 'tpope/vim-fugitive' })
        use('folke/lua-dev.nvim')

        use({
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end,
        })

        use({
            'LunarVim/onedarker.nvim',
            config = function()
                require('user.plugins.theming')
            end,
        })

        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            requires = { 'lewis6991/spellsitter.nvim' },
            config = function()
                require('user.plugins.treesitter')
            end,
        })

        use({
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function()
                require('user.plugins.telescope')
            end,
        })

        use({
            'ahmedkhalf/project.nvim',
            config = function()
                require('user.plugins.project')
            end,
        })

        use({
            'neovim/nvim-lspconfig',
            requires = { 'williamboman/nvim-lsp-installer' },
            config = function()
                require('user.plugins.lsp-config')
            end,
        })

        use({
            'L3MON4D3/LuaSnip',
            requires = 'rafamadriz/friendly-snippets',
            config = function()
                require('user.plugins.luasnip')
            end,
        })
        use({
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-nvim-lsp-signature-help',
                'saadparwaiz1/cmp_luasnip',
                'onsails/lspkind-nvim',
            },
            config = function()
                require('user.plugins.cmp')
            end,
        })
        use({
            'windwp/nvim-autopairs',
            config = function()
                require('user.plugins.autopairs')
            end,
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                require('user.plugins.null-ls')
            end,
        })

        use({
            'folke/trouble.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('user.plugins.trouble')
            end,
        })

        use({
            'akinsho/bufferline.nvim',
            tag = '*',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('user.plugins.bufferline')
            end,
        })

        use({
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require('user.plugins.lualine')
            end,
        })

        use({
            'lewis6991/gitsigns.nvim',
            config = function()
                require('user.plugins.gitsigns')
            end,
        })

        if bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end,
        },
    },
})
