return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    opts = function()
        return {
            ensure_installed = {
                "clangd",
                "html",
                "lua_ls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
            },

            -- Auto-install configured servers (with lspconfig)
            automatic_installation = true,
        }
    end,
}
