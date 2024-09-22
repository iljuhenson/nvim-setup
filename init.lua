require('user.plugins')
require('user.autocomplete')
require('user.keybindings')


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true
vim.wo.relativenumber = true

-- PROJECT TREE VIEW SETUP
require("nvim-tree").setup({
	on_attach = CustomNvimTreeOnAttach,
	view = {relativenumber = true}
})
require'nvim-web-devicons'.setup {
 default = true;
 strict = true;
}

-- LANGUAGE SERVER INSTALLER SETUP
require("mason").setup()
require("mason-lspconfig").setup()


-- LANGUAGE SERVERS
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").gopls.setup {}


-- COLORSCHEME SETUP
vim.cmd("colorscheme nightfox")

