return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			'nvim-java/nvim-java',
		},

		config = function ()
			require('java').setup()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true
			})

			local cmp = require'cmp'

			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'vsnip' }, -- For vsnip users.,
				}, {
					{ name = 'buffer' },
				})
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("lspconfig").solargraph.setup {
				capabilities = capabilities,
			}
			require("lspconfig").lua_ls.setup {
				capabilities = capabilities,
			}
			require("lspconfig").gopls.setup {
				capabilities = capabilities,
			}
			require("lspconfig").ts_ls.setup {
				capabilities = capabilities,
			}
			require("lspconfig").jdtls.setup {
				capabilities = capabilities,
			}
			require("lspconfig").sqlls.setup {
				capabilities = capabilities,
				filetypes = { "sql" },
			}

			vim.keymap.set('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
			vim.keymap.set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
			vim.keymap.set('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
			vim.keymap.set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
			vim.keymap.set('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
			vim.keymap.set('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
			vim.keymap.set('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
			vim.keymap.set('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
			vim.keymap.set('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
			vim.keymap.set('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
			vim.keymap.set('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
			vim.keymap.set('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
			vim.keymap.set('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
			vim.keymap.set('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
			vim.keymap.set('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
			vim.keymap.set('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
		end
	}
}
