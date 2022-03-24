"========================================
"               BASE CONFIG
"========================================

syntax on
set termguicolors
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set shiftwidth=4
set number
set numberwidth=4
set relativenumber
set incsearch
set nohlsearch
set splitbelow
set splitright
set hidden
set scrolloff=8
set undofile
set mouse=a
set ignorecase
set smartcase
set noshowmode
set nowrap
set clipboard+=unnamedplus
set list
set listchars=tab:\ ,trail:
set backspace=indent,eol,start
set hidden

"========================================
"               REMAPS
"========================================

let mapleader=" "

map gf :edit <cfile><cr>

map <leader>bd :bd<CR>
map <leader>bn :bn<CR>
map <leader>bp :bp<CR>

vnoremap < <gv
vnoremap > >gv

vnoremap y myy`y
vnoremap Y myY`y

noremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

noremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>
imap jj <esc>
imap <S-tab> <C-D>

nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

vnoremap p "_dP

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

autocmd FileType python map <leader>R :w<CR>:!python3 %<CR>

"========================================
"               PLUGINS
"========================================

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')

source ~/.config/nvim/plugins/theming.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/devicons.vim
source ~/.config/nvim/plugins/nvim-lspconfig.vim
source ~/.config/nvim/plugins/completion.vim
source ~/.config/nvim/plugins/plenary.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vim-hexokinase.vim
source ~/.config/nvim/plugins/vim-fugitive.vim
source ~/.config/nvim/plugins/gitsigns.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/refactoring.lua
source ~/.config/nvim/plugins/vim-polyglot.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/autopep8.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/renamer.vim
source ~/.config/nvim/plugins/maya-sender.vim

call plug#end()

doautocmd User PlugLoaded

source ~/.config/nvim/plugins/maya.vim

