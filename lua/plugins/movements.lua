return {
    {
        'ggandor/leap.nvim',
        dependencies = { 'tpope/vim-repeat' },
		event = {'BufReadPre', 'BufNewFile'},
        keys = {
            { 's', '<Plug>(leap)', mode = { 'n', 'v' } },
            { 'gs', '<Plug>(leap-from-window)', mode = { 'n', 'v' } },
        },
    }
}
