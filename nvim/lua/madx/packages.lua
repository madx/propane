vim.cmd.packadd("packer.nvim")

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim")

  -- UI
  use("sainnhe/sonokai")
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")

  -- Tree-Sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/nvim-treesitter-context")

  -- Completion/LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
      { "jose-elias-alvarez/typescript.nvim" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
      { "weilbith/nvim-code-action-menu" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "L3MON4D3/LuaSnip" },
    },
  })

  -- Utilities
  use("lewis6991/gitsigns.nvim")
  use("folke/trouble.nvim")
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  })
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })
  use({
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
  })
  use("windwp/nvim-ts-autotag")
  use("gboncoffee/lf.vim")

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })
end)

-- \ 'https://github.com/epwalsh/obsidian.nvim',
