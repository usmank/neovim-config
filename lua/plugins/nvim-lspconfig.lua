return {
    "neovim/nvim-lspconfig",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below
        -- functions
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

        -- Use LspAttach autocommand to only map the following keys after the
        -- language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <C-x><C-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below
                -- functions
                --local opts = {buffer = ev.buf}
                local function opts(desc)
                    return { buffer = ev.buf, desc = desc }
                end
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto definition"))
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Show documentation"))
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Goto implementation"))
                -- vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, opts("Show signature"))
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts("Show type definition"))
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code actions"))
                -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Show references"))
                vim.keymap.set("n", "<leader>gf", function()
                    vim.lsp.buf.format { async = true }
                end, opts("Code format"))
            end,
        })

        -- Customize icons shown in the gutter for errors, warnings, etc.
        local signs = {
            Error = "",
            Warn  = "",
            Hint  = "󰌶",
            Info  = "",
        }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        local lspconfig = require("lspconfig")
        lspconfig.clangd.setup({})
        lspconfig.html.setup({})
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make language server aware of runtime files
                        library = {
                            vim.fn.expand("$VIMRUNTIME/lua"),
                            vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                            vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                            vim.fn.stdpath("config"),
                            "${3rd}/luv/library",
                        },
                    },
                },
            },
        })
        lspconfig.pyright.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.rust_analyzer.setup({
            on_attach = function(_, bufnr)
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end,
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        })
    end,
}
