return {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    cmd = {
        "TSInstall",
        "TSBufEnable",
        "TSBufDisable",
        "TSModuleInfo",
    },
    build = ":TSUpdate",
    opts = function()
        return {
            -- A list of parser names, or "all"
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "comment",
                "cpp",
                "dockerfile",
                "fortran",
                "go",
                "graphql",
                "haskell",
                "html",
                "java",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "latex",
                "llvm",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "ninja",
                "perl",
                "python",
                "ruby",
                "rust",
                "scheme",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },

            -- Install parsers synchronously (only applied to
            -- `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- List of parsers to ignore installing (for "all")
            ignore_install = {},

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- NOTE: these are the names of the parsers and not the file
                -- type. (for example if you want to disable highlighting for
                -- the `tex` file type, you need to include `latex` in this
                -- list as this is the name of the parser)
                -- list of languages that will be disabled
                disable = {},

                -- Setting this to true will run `:h syntax` and tree-sitter at
                -- the same time. Set this to `true` if you depend on `syntax`
                -- being enabled (like for indentation). Using this option may
                -- slow down your editor, and you may see some duplicate
                -- highlights. Instead of true it can also be a list of
                -- languages.
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },
        }
    end,
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
