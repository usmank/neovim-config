return {
    "hrsh7th/nvim-cmp",
    -- Only load when entering insert mode.
    event = "InsertEnter",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "rafamadriz/friendly-snippets",
            }
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        require("luasnip.loaders.from_vscode").lazy_load()

        local config = {
            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),

                -- Accept currently selected item. Set 'select' to 'false' to
                -- only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping.confirm({select = true}),
            }),
            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                {name = "luasnip"},
                {name = "buffer"},
                {name = "path"},
            }),
            formatting = {
                format = lspkind.cmp_format(),
            },
        }

        return config
    end,
}
