vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- requires nvim-treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- don't wrap lines
vim.opt.wrap = false

-- required for some in-place rendering by obsidian.nvim
-- see https://github.com/epwalsh/obsidian.nvim/issues/286
vim.opt.conceallevel = 1
