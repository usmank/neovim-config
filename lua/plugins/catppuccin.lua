return {
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    lazy = false,
    config = function()
        -- Load the colorscheme
        vim.cmd.colorscheme("catppuccin-latte")

        -- Override certain highlight groups
        local highlights = {
            --SpellBad = {
            --    link = "DiagnosticVirtualTextError",
            --},
        }

        for hl, col in pairs(highlights) do
            vim.api.nvim_set_hl(0, hl, col)
        end
    end
}

