-- LSP
require("mason").setup()

require("mason-null-ls").setup({
  automatic_setup = true,
})

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gR", function()
    vim.lsp.buf.rename()
  end, opts)
  vim.keymap.set("n", "g<Space>", function()
    vim.cmd("CodeActionMenu")
  end, opts)
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end)

lsp.skip_server_setup({ "tsserver" }) -- Configured manually with typescript.nvim

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.tailwindcss.setup({})
lspconfig.cssls.setup({})

lsp.setup()

require("typescript").setup({
  server = {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = "non-relative",
      },
    },
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  },
})

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- JS/TS
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,

    -- Lua
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end,
})
