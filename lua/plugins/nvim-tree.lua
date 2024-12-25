return {
    "nvim-tree/nvim-tree.lua",
    cmd = {
        "NvimTreeToggle",
        "NvimTreeFOcus",
    },
    opts = function()
        return {
            view = {
                adaptive_size = true,
                cursorline = false,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                special_files = {}, -- Don't highlight files like README.md
                icons = {
                    git_placement = "after",
                    glyphs = {
                        git = {
                            unstaged = "",
                            staged = "",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "",
                            deleted = "",
                            ignored = "󱙝",
                        },
                    },
                },
            },
            git = {
                enable = true,
            },
        }
    end,
}