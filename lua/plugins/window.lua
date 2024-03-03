return {
    "yorickpeterse/nvim-window",
    keys = {
        { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", "n", desc = "Jump to window" },
        { "<C-w>", "<cmd>lua require('nvim-window').pick()<cr>", "n", desc = "Jump to window" },
    },
    config = true,
}