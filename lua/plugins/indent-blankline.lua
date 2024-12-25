return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
        return {
            scope = {
                show_start = false,
                show_end   = false,
            },
        }
    end,
    config = function(_, opts)
        -- Do not show indent guide for first indent level.
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

        require("ibl").setup(opts)
    end,
}
