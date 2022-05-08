local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
    bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')
        use('tpope/vim-surround')
        use('tpope/vim-fugitive')

        use('kyazdani42/nvim-web-devicons')

        use({
            'LunarVim/onedarker.nvim',
            config = function()
                require('user.plugins.theming')
            end,
        })

        use({
            'akinsho/bufferline.nvim',
            tag = '*',
            config = function()
                require('user.plugins.bufferline')
            end,
        })

        use({
            'nvim-lualine/lualine.nvim',
            config = function()
                require('user.plugins.lualine')
            end,
        })

        use({ 'lewis6991/spellsitter.nvim' })

        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function()
                require('user.plugins.treesitter')
            end,
        })

        use('nvim-lua/plenary.nvim')
        use('nvim-telescope/telescope-file-browser.nvim')

        use({
            'nvim-telescope/telescope.nvim',
            config = function()
                require('user.plugins.telescope')
            end,
        })

        use({
            'ThePrimeagen/refactoring.nvim',
            config = function()
                require('user.plugins.refactor')
            end,
        })

        use({
            'ahmedkhalf/project.nvim',
            config = function()
                require('user.plugins.project')
            end,
        })

        use({
            'folke/trouble.nvim',
            config = function()
                require('user.plugins.trouble')
            end,
        })

        use('williamboman/nvim-lsp-installer')

        use({
            'neovim/nvim-lspconfig',
            config = function()
                require('user.plugins.lsp-config')
            end,
        })

        use({
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                require('user.plugins.null-ls')
            end,
        })

        use('hrsh7th/cmp-nvim-lsp')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-nvim-lua')
        use('saadparwaiz1/cmp_luasnip')
        use('onsails/lspkind-nvim')
        use('L3MON4D3/LuaSnip')
        use('rafamadriz/friendly-snippets')
        use({
            'hrsh7th/nvim-cmp',
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
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end,
        })

        if bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({
                    border = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
                })
            end,
        },
    },
})
