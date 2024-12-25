return {
    'maxmx03/solarized.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
        palette = 'solarized',
        variant = 'sprint',
    },
    config = function(_, opts)
        vim.o.termguicolors = true
        vim.o.background = 'dark'
        require('solarized').setup(opts)
        vim.cmd.colorscheme 'solarized'
    end,
}
