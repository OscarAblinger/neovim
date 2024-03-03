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
		keys = {
			-- also already bound to ]d (with [d going back)
			{ '<leader>c', '<cmd>lua vim.diagnostic.goto_next()<cr>', 'n', desc = 'Cycle forward through diagnostics. (Next diagnostic)' },
		},
	}
}

--[[
return {
	{ 'VonHeikemen/lsp-zero.nvim', branch = 'dev-v3' },

	-- manage servers from inside nvim (e.g. with :LspInstall)
	{ 'williamboman/mason.nvim', build = ':MasonUpdate', lazy = false },
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			{ 'neovim/nvim-lspconfig' }, -- lsp support
			{ 'hrsh7th/cmp-nvim-lsp' }, -- dependency for nvim-lspconfig
		},
		config = function()
			local lsp = require('lsp-zero').preset({})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({buffer = bufnr})
			end)

			require('mason-lspconfig').setup({
				handlers = {
					lsp.default_setup,
					lua_ls = function()
						require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
					end,
				}
			})
		end
	},

	-- autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
		}
	}
}
]]--

--[[
-- see https://github.com/VonHeikemen/lsp-zero.nvim/blob/dev-v3/doc/md/guides/lazy-loading-with-lazy-nvim.md
return {
	{
		-- make stuff work together
		{ 'VonHeikemen/lsp-zero.nvim', branch = 'dev-v3', config = false },

		-- manage lsp servers from nvim
		-- :LspInstall
		-- see https://github.com/VonHeikemen/lsp-zero.nvim/tree/dev-v3#automatic-setup-of-lsp-servers
		{ 'williamboman/mason.nvim', build = ':MasonUpdate' },

		-- autocomplete
		{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			dependencies = {
				{ 'L3MON4D3/LuaSnip' }
			},
			config = function()
				require('lsp-zero').extend_cmp()

				local cmp = require('cmp')
				local cmp_action = require('lsp-zero').cmp_action()

				cmp.setup({
					mapping = {
						['<C-Space>'] = cmp.mapping.complete()
					}
				})
			end
		},
		{
			'williamboman/mason-lspconfig.nvim',
			cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
			event = { 'BufReadPre', 'BufNewFile' },
			dependencies = {
				{ 'hrsh7th/cmp-nvim-lsp' },
			},
			config = function()
				local lsp = require('lsp-zero').preset({})

				lsp.on_attach(function(client, bufnr)
					lsp.default_keymaps({buffer = bufnr})
				end)

				require('mason-lspconfig').setup({
					-- ensure_installed = { 'rust_analyzer' },
					handlers = {
						lsp.default_setup,
						lua_ls = function()
							require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
						end,
					}
				})
			end
		},
	}
}
]]--
