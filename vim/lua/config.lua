--------------------------------------------------------------------------------
-- Utils

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--------------------------------------------------------------------------------
-- Automatic LSP server installs
local lspconfig = require("lspconfig")

require("nvim-lsp-installer").setup {
  automatic_installation = true
}

--------------------------------------------------------------------------------
-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "javascript", "typescript", "html", "markdown", "html", "css" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

--------------------------------------------------------------------------------
-- nvim-cmp
vim.api.nvim_set_option("completeopt", "menu,menuone,noselect")

local cmp = require("cmp")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = false })
      else
        fallback()
      end
    end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
  })
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

--------------------------------------------------------------------------------
-- LSP servers configurations
local on_attach = function(client, bufnr)
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  buf_map(bufnr, "n", "<Leader>gd", ":LspDef<CR>")
  buf_map(bufnr, "n", "<Leader>gr", ":LspRename<CR>")
  buf_map(bufnr, "n", "<Leader>gt", ":LspTypeDef<CR>")
  buf_map(bufnr, "n", "<Leader>gg", ":LspHover<CR>")
  buf_map(bufnr, "n", "<Leader>gn", ":LspDiagPrev<CR>")
  buf_map(bufnr, "n", "<Leader>gp", ":LspDiagNext<CR>")
  buf_map(bufnr, "n", "<Leader>g<space>", ":LspCodeAction<CR>")
  buf_map(bufnr, "n", "<Leader>gl", ":LspDiagLine<CR>")
  buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

for _, lspserver in ipairs({ "intelephense", "tailwindcss", "vimls" }) do
  lspconfig[lspserver].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)

    on_attach(client, bufnr)
  end
})

lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

--------------------------------------------------------------------------------
-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd,
  },
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
})


--------------------------------------------------------------------------------
-- Trouble
require("trouble").setup {
  icons = false,
  fold_open = "v",
  fold_closed = ">",
  indent_lines = false,
  signs = {
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info"
  },
  use_diagnostic_signs = false
}
