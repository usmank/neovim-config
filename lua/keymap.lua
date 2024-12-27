local map = vim.keymap.set

local function default_opts(desc)
    return { noremap = true, silent = true, desc = desc }
end

local function nonsilent_opts(desc)
    return { noremap = true, silent = false, desc = desc }
end

-- Toggle spell check
map("n", "<leader>sp", ":set spell!<CR>", nonsilent_opts("Toggle spell check"))

-- Toggle paste mode
map("n", "<leader>p", ":set paste!<CR>", nonsilent_opts("Toggle paste mode"))

-- Save
map("n", "<leader>w", ":update<CR>", nonsilent_opts("Save current bufffer"))

-- Treate wrapped lines as multiple lines
map({ "n", "v" }, "j", "gj", default_opts())
map({ "n", "v" }, "k", "gk", default_opts())

-- Zoom into current split
map("n", "<C-w>z", "<C-w><Bar><C-w>_", default_opts("Maximize current split"))

-- Sort lines in paragraph
map("n", "<leader>si", "vip:sort<CR>", default_opts("Sort lines in paragraph"))

-- Toggle list chars
map("n", "<leader>ll", ":set list!<CR>", default_opts("Toggle list chars"))

-- Make search more magical
map("n", "/", "/\\v", default_opts())
map("n", "?", "?\\v", default_opts())

-- Clear search highlighting
map("n", "<leader><leader>", ":nohlsearch<CR>", default_opts("Clear search highlighting"))

-- Open/close quickfix
map("n", "<leader>co", ":copen<CR>", default_opts("Open quickfix window"))
map("n", "<leader>cc", ":cclose<CR>", default_opts("Close quickfix window"))

----------------------
-- Split Navigation --
----------------------
map("n", "<C-h>", "<C-w><C-h>", default_opts("Move to left split"))
map("n", "<C-j>", "<C-w><C-j>", default_opts("Move to lower split"))
map("n", "<C-k>", "<C-w><C-k>", default_opts("Move to upper split"))
map("n", "<C-l>", "<C-w><C-l>", default_opts("Move to right split"))

----------------
-- Tabularize --
----------------
map({ "n", "v" }, "<leader>tab", ":Tabularize /", default_opts("Tabularize"))

----------------------
-- Indent Blankline --
----------------------
map("n", "<leader>ibl", ":IBLToggle<CR>", default_opts("Toggle indent guides"))

--------------
-- NvimTree --
--------------
map("n", "<leader>n", ":NvimTreeToggle<CR>", default_opts("Toggle file explorer"))

--------------------
-- Fugitive (Git) --
--------------------
map("n", "<leader>gg", ":G<CR>", default_opts("Open Fugitive window"))
map("n", "<leader>gd", ":Gvdiffsplit<CR>", default_opts("Git diff current file"))
map("n", "<leader>gb", ":G blame<CR>", default_opts("Open Git blame window"))

---------
-- fzf --
---------
-- map("n", "<leader>tc", ":Commands<CR>", default_opts("Show Vim commands"))
-- map("n", "<leader>f", ":Files<CR>", default_opts("Show files"))
-- map("n", "<leader>b", ":Buffers<CR>", default_opts("Show open buffers"))
-- map("n", "<leader>o", ":BTags<CR>", default_opts("Show tags from current buffer"))
-- map("n", "<leader>O", ":Tags<CR>", default_opts("Show tags from project"))
-- map("n", "<leader>gl", ":BCommits<CR>", default_opts("Show commits from current buffer"))

---------------
-- Telescope --
---------------
map("n", "<leader>/", ":Telescope live_grep<CR>", default_opts("Show live grep window"))
map("n", "<leader>tc", ":Telescope commands<CR>", default_opts("Show commands"))
map("n", "<leader>f", ":Telescope find_files<CR>", default_opts("Show files"))
map("n", "<leader>b", ":Telescope buffers<CR>", default_opts("Show open buffers"))
map("n", "<leader>tr", ":Telescope resume<CR>", default_opts("Resume most recent Telescope window"))
map("n", "<leader>o", ":Telescope lsp_document_symbols<CR>", default_opts("Show symbols in current buffer"))
map("n", "<leader>th", ":Telescope help_tags<CR>", default_opts("Show help tags"))
map("n", "<leader>gr", ":Telescope lsp_references<CR>", default_opts("Show references"))

------------
-- Tagbar --
------------
map("n", "<leader>so", ":TagbarToggle<CR>", default_opts("Toggle tagbar"))

------------
-- Outline --
------------
map("n", "<leader>so", ":Outline<CR>", default_opts("Toggle symbol outline"))

--------------
-- WhichKey --
--------------
map("n",
    "<leader>?",
    function()
        require("which-key").show({ global = true })
    end,
    default_opts("Show key mappings"))

