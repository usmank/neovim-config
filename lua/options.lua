local opt = vim.opt

-- General
opt.colorcolumn    = "80"
opt.mouse          = "a"
opt.number         = true
opt.relativenumber = true
opt.scrolloff      = 2
opt.sidescroll     = 2
opt.sidescrolloff  = 4
opt.signcolumn     = "yes"
opt.spelllang      = "en_us"
opt.splitright     = true
opt.swapfile       = false
opt.termguicolors  = true
opt.textwidth      = 0
opt.wildignorecase = true
opt.wildmode       = {"longest", "list"}
opt.wrap           = false

-- Spaces and tabs
opt.listchars = {
    tab      = "|.",
    trail    = "•",
    precedes = "…",
    extends  = "…",
    nbsp     = "_",
    space    = "•",
    eol      = "↴",
}
opt.expandtab   = true
opt.shiftwidth  = 4
opt.smarttab    = true
opt.softtabstop = 4
opt.tabstop     = 4

-- Indentation
opt.autoindent = true
opt.copyindent = true

-- Search
opt.hlsearch   = true
opt.ignorecase = true
opt.incsearch  = true
opt.smartcase  = true
opt.wrapscan   = false

-- Ctags
opt.tags = "./tags,tags,../tags"

-- Polyglot
vim.g.polyglot_disabled = {'autoindent'}

