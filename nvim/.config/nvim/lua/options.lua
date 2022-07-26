vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.signcolumn = 'yes:1'
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.spell = false
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·'
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = 'unnamedplus'
vim.opt.confirm = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('data') .. '/backup//'
vim.opt.updatetime = 250
vim.opt.redrawtime = 10000
vim.opt.showmode = false
vim.opt.fillchars = 'eob: '
vim.opt.hlsearch = false
vim.opt.pumheight = 7
vim.opt.smartindent = true
vim.opt.laststatus = 3
vim.o.completeopt = 'menuone,longest,preview'

vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank { higroup="QuickFixLine", timeout=200 } ]])
vim.cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]])
vim.cmd([[ autocmd BufRead,BufNewFile *.conf setf bash ]])
