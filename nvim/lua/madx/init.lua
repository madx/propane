vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Global configuration
require("madx.lazy-bootstrap")
require("madx.lazy-packages")
require("madx.options")
require("madx.keymap")
require("madx.theme")

-- Per-package configuration
require("madx.packages.treesitter")
require("madx.packages.lsp")
require("madx.packages.cmp")
require("madx.packages.telescope")
require("madx.packages.lualine")
require("madx.packages.which-key")
require("madx.packages.gitsigns")

-- Load plugins that don't need a specific config
require("todo-comments").setup()
require("nvim-surround").setup()
require("Comment").setup()
require("nvim-ts-autotag").setup()
