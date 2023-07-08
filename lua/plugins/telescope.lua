return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ '<leader>pf', '<cmd>Telescope find_files<cr>', 'n', desc = 'Find files in project' },
			{ '<leader>gf', '<cmd>Telescope git_files<cr>', 'n', desc = 'Find files in git repo' },
			{ '<leader>pb', '<cmd>Telescope buffers<cr>', 'n', desc = 'Find in buffers' },
			{ '<leader>pg', '<cmd>Telescope live_grep<cr>', 'n', desc = 'Live Grep in project' },
		}
	},
}
