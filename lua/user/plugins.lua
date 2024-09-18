local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- LSP setup start
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
-- LSP setup end

-- Autocompletion setup start
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
-- Autocompletion setup end

-- Comment out engine setup start
Plug 'tpope/vim-commentary'
-- Comment out engine setup end

-- Color scheme setup start
-- Plug('catppuccin/nvim', { ['as'] = 'cappucin' })
Plug 'EdenEast/nightfox.nvim'
-- Color scheme setup end
--
-- Project Tree View setup start
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
-- Project Tree View setup end

-- Searching files by names and content start
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ['tag']= '0.1.8' })
-- Searching files by names and content end

-- Context(class, functions, modules) start
Plug 'wellle/context.vim'
-- Context(class, functions, modules) end
vim.call('plug#end')
