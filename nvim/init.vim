set nu rnu
set hidden

let mapleader = "\<BS>"
let maplocalleader = " "

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set completeopt=menu,menuone,noselect

source ~/.config/nvim/vim-plug/plugins.vim

luafile ~/.config/nvim/lua/nvim-cmp/nvim-cmp.lua

luafile ~/.config/nvim/lua/lsp/lspconf.lua

source ~/.config/nvim/vim-vsnip.vim

" source ~/.config/nvim/themes/onehalf.vim
source ~/.config/nvim/themes/gruvbox.vim

source ~/.config/nvim/lightline.vim

