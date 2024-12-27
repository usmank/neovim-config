return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = {
        "Outline",
        "OutlineOpen",
    },
    dependencies = {
        "nvim-lspconfig",
    },
    opts = function()
        return {
            symbol_folding = {
                -- Disable autofolding.
                autofold_depth = false,
            },
            symbols = {
                icons = {
                    File          = {icon = '󰈔', hl  = 'Identifier'},
                    Module        = {icon = '󰆧', hl  = 'Include'},
                    Namespace     = {icon = '', hl  = 'Include'},
                    Package       = {icon = '󰏗', hl  = 'Include'},
                    Class         = {icon = '', hl  = 'Type'},
                    Method        = {icon = '󰊕', hl  = 'Function'},
                    Property      = {icon = '', hl  = 'Identifier'},
                    Field         = {icon = '', hl  = 'Identifier'},
                    Constructor   = {icon = '', hl  = 'Special'},
                    Enum          = {icon = '', hl  = 'Type'},
                    Interface     = {icon = '', hl  = 'Type'},
                    Function      = {icon = '󰊕', hl  = 'Function'},
                    Variable      = {icon = '', hl  = 'Constant'},
                    Constant      = {icon = '', hl  = 'Constant'},
                    String        = {icon = '', hl  = 'String'},
                    Number        = {icon = '', hl  = 'Number'},
                    Boolean       = {icon = '', hl  = 'Boolean'},
                    Array         = {icon = '', hl  = 'Constant'},
                    Object        = {icon = '⦿', hl  = 'Type'},
                    Key           = {icon = '', hl  = 'Type'},
                    Null          = {icon = '󰟢', hl  = 'Type'},
                    EnumMember    = {icon = '', hl  = 'Identifier'},
                    Struct        = {icon = '', hl  = 'Structure'},
                    Event         = {icon = '', hl  = 'Type'},
                    Operator      = {icon = '', hl  = 'Identifier'},
                    TypeParameter = {icon = '𝙏', hl  = 'Identifier'},
                    Component     = {icon = '󰅴', hl  = 'Function'},
                    Fragment      = {icon = '󰅴', hl  = 'Constant'},
                    TypeAlias     = {icon = ' ', hl = 'Type'},
                    Parameter     = {icon = ' ', hl = 'Identifier'},
                    StaticMethod  = {icon = ' ', hl = 'Function'},
                    Macro         = {icon = ' ', hl = 'Function'},
                },
            },
        }
    end,
    config = function (_, opts)
        require("outline").setup(opts)
    end,
}
