return {
	{
		-- also see entry in options.lua for folding
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = 'all',
				highlight = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = 'gvn',
                                                node_incremental = '+',
                                                node_decremental = '-',
                                                scope_incremental = 'g+',
					},
				},
			})
		end,
	},
	{	-- todo: doesn't work :(
		'ziontee113/syntax-tree-surfer',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		keys = {
			{ 'vx', '<cmd>STSSelectMasterNode<cr>', 'n', desc = 'Select Treesitter master node' },
			{ 'vn', '<cmd>STSSelectCurrentNode<cr>', 'n', desc = 'Select Treesitter current node' },
		},
	}
}
