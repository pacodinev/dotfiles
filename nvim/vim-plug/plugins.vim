" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'neovim/nvim-lspconfig' 		" Collection of configurations for built-in LSP client


" Plug 'hrsh7th/nvim-cmp' 		" Autocompletion plugin
" Plug 'hrsh7th/cmp-nvim-lsp' 		" LSP source for nvim-cmp
" Plug 'saadparwaiz1/cmp_luasnip' 	" Snippets source for nvim-cmp
" Plug 'L3MON4D3/LuaSnip' 		" Snippets plugin
" Plug 'ray-x/lsp_signature.nvim'		" Show function signature when you type

Plug 'hrsh7th/cmp-nvim-lsp'     " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'       
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'          " Autocompletion plugin   

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'sonph/onehalf', { 'rtp': 'vim' }      " onehalf theme

Plug 'itchyny/lightline.vim'            " lightline
Plug 'morhetz/gruvbox'

Plug 'psliwka/vim-smoothie'         " Smooth scroll

" Initialize plugin system
call plug#end()
