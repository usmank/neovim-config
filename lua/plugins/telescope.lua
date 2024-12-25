return {
    "nvim-telescope/telescope.nvim",
    opts = function()
        return {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = " ",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },
                mappings = {
                    n = {
                        ["q"] = require("telescope.actions").close
                    },
                },
                sorting_strategy = "ascending",
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim"
                }
            },
        }
    end,
}
