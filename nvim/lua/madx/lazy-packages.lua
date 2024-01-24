require("lazy").setup({
  -- Theme
  { "sainnhe/sonokai", priority = 1000 },

  -- "nvim-tree/nvim-web-devicons",
  -- "nvim-lualine/lualine.nvim",

  -- Tree-Sitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
      },
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
  },
  { "jose-elias-alvarez/typescript.nvim" },
  --{
  --  "VonHeikemen/lsp-zero.nvim",
  --  branch = "v2.x",
  --  requires = {
  --    -- LSP Support
  --    { "jose-elias-alvarez/null-ls.nvim" },
  --    { "jay-babu/mason-null-ls.nvim" },
  --    { "jose-elias-alvarez/typescript.nvim" },
  --    { "JoosepAlviste/nvim-ts-context-commentstring" },
  --    { "weilbith/nvim-code-action-menu" },
  --  },
  --},

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "rafamadriz/friendly-snippets" },
    },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
  },

  -- Enhancements
  { "aznhe21/actions-preview.nvim" },
  { "nvim-lualine/lualine.nvim" },
  { "folke/which-key.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "folke/trouble.nvim" },
  { "folke/todo-comments.nvim" },
  { "windwp/nvim-autopairs" },
  { "kylechui/nvim-surround" },
  { "numToStr/Comment.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "chrisgrieser/nvim-puppeteer" },
})
