return {
    'epwalsh/obsidian.nvim',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp', 'nvim-telescope/telescope.nvim', 'nvim-treesitter/nvim-treesitter' },
    ft = 'markdown',
    keys = {
        { '<C-o>', '<cmd>ObsidianOpen<cr>', 'n', desc = 'Open note in Obsidian' },
        { '<Leader>oo', '<cmd>ObsidianFollowLink<cr>', 'n', desc = 'Open link' },
        { '<Leader>os', '<cmd>ObsidianFollowLink vsplit<cr>', 'n', desc = 'Open link in split' },
    },
    opts = {
        workspaces = {
            {
                name = 'Brain',
                path = '~/Documents/Obsidian/Brain',
            },
            {
                name = 'TTRPGs',
                path = '~/Documents/Obsidian/TTRPGs',
            },
            {
                name = 'Current Folder',
                path = function()
                    return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
                end,
            },
        },
        mappings = {}, -- remove default mappings
        new_notes_location = 'current_dir',
    },
}
