-- Relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- UI settings
vim.opt.wrap = false -- Do not wrap lines
vim.opt.showcmd = true -- Show current command
vim.opt.shortmess:append("I") -- Disable intro message
vim.opt.signcolumn = "yes:1" -- Always show signcolumn, 1 char wide
vim.opt.splitbelow = true -- Open split window below current
vim.opt.splitright = true -- Open split window right of current
vim.opt.scrolloff = 5 -- Keep 5 lines after/before scrolling
vim.opt.list = true -- Show special chars
vim.opt.listchars = "nbsp:␣,trail:⋅"
vim.opt.fillchars = "vert:┃,fold:-,eob: "
vim.opt.virtualedit = "block" -- Allow selecting any area in visual block
vim.opt.termguicolors = true

-- Text editing
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Backup/swap files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("XDG_CONFIG_HOME") .. "/nvim/undodir"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse
vim.opt.mouse = "a"

-- Timeouts
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Completion
vim.opt.completeopt = "menuone,noselect"
