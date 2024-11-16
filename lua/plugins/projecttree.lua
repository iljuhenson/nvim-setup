return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},

		config = function ()
			function CustomNvimTreeOnAttach(bufnr)
				local api = require("nvim-tree.api")

				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set('n', '<Leader>e', api.tree.toggle)
				vim.keymap.set('n', '<Leader>se', function () return api.tree.open({find_file = true}) end)
				vim.keymap.set('n', 'gr', function ()
					if vim.g.nvim_tree_group_empty == 1 then
						vim.g.nvim_tree_group_empty = 0
					else
						vim.g.nvim_tree_group_empty = 1
					end
				end)
			end

			require("nvim-tree").setup({
				on_attach = CustomNvimTreeOnAttach,
				view = {
					relativenumber = true,
					width = 50,
				}
			})

			vim.g.nvim_tree_group_empty = 1
		end
	}
}
