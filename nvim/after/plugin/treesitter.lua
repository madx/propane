require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "html", "markdown", "markdown_inline", "html", "css" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
})

require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  trim_scope = "outer",
})
