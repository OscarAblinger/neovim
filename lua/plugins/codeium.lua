return {
	'Exafunction/codeium.nvim',
	requires = {
		'nvim-lua/plenary.nvim',
		'hrsh7th/nvim-cmp',
	},
	config = function()
		require('codeium').setup({
			config_path = 'C:/Users/Oscar/AppData/Local/nvim/extern/codeium.nvim/codeium_config.json',
			language_server = 'C:/Users/Oscar/AppData/Local/nvim/extern/codeium.nvim/language_server_windows_x64.exe'
--			config_path = '~/.codeium/config.json',
--			language_server = '~/AppData/Local/nvim/extern/codeium.nvim/language_server_windows_x64.exe'
		})
	end,
--	build = ':Codeium Auth',
}
