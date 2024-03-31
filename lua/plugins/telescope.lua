return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ '<leader>pf', '<cmd>Telescope find_files<cr>', 'n', desc = 'Find files in project' },
			{ '<leader>gf', '<cmd>Telescope git_files<cr>', 'n', desc = 'Find files in git repo' },
			{ '<leader>po', '<cmd>Telescope oldfiles<cr>', 'n', desc = 'Find previously opened files' },
			{ '<leader>pb', '<cmd>Telescope buffers<cr>', 'n', desc = 'Find in buffers' },
			{ '<leader>pg', '<cmd>Telescope live_grep<cr>', 'n', desc = 'Live Grep in project' },
			{ '<leader>pc', '<cmd>Telescope keymaps<cr>', 'n', desc = 'Find NVim commands' },
			{ '<leader>pdl', '<cmd>Telescope lsp_document_symbols<cr>', 'n', desc = 'Find LSP symbols in the current buffer' },
			{ '<leader>pl', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'n', desc = 'Find LSP symbols in the current workspace' },
		},
		opts = {
			defaults = {
				mappings = {
					-- remember: you can press '?' in normal mode to get a list of actions _during_ telescope searches
					i = {
						["<C-s>"] = "which_key",
					}
				},
			},
		},
	},
}
