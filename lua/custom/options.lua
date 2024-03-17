vim.opt.number = true
vim.opt.relativenumber = true

-- requires nvim-treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
