return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'dev-v3',
		lazy = true,
		config = false,
	},
	{
		'williamboman/mason.nvim',
		cmd = {'Mason', 'MasonInstall', 'MasonUpdate'},
		lazy = true,
		config = true,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{'L3MON4D3/LuaSnip'},
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			require('lsp-zero').extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_action = require('lsp-zero').cmp_action()

			cmp.setup({
				mapping = {
					['<C-Space>'] = cmp.mapping.complete(),
					['<Tab>'] = cmp.mapping.confirm({select = true}),
				},
				sources = {
					{ name = 'codeium' },
					{ name = 'nvim_lsp' },
				}
			})
		end
	},

	-- LSP
	{
		'williamboman/mason-lspconfig.nvim',
		cmd = {'LspInfo', 'LspInstall', 'LspStart'},
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/cmp-nvim-lsp'},
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require('lsp-zero').preset({})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({buffer = bufnr})
			end)

			require('mason-lspconfig').setup({
				ensure_installed = {'lua_ls'},
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
					end,
				}
			})
		end,
	},
	-- LSP diagnostic UI
	{
		'folke/trouble.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons', 'folke/lsp-colors.nvim'},
		-- todo: configure nicer keymapping
	},
	-- prettier LSP
	{
		'nvimdev/lspsaga.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons', 'nvim-treesitter/nvim-treesitter'},
		config = function()
			require('lspsaga').setup({})
		end,
		-- todo: configure nicer keymapping
	},
}
