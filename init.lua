-- standard values
require('custom')

-- set up lazy.nvim: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", "--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim plugins
require("lazy").setup('plugins') -- configures lazy to look at ./lua/plugins and load all files there
