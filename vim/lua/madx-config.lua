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
-- Trouble
require("trouble").setup {
  icons = true,
  height = 8,
  padding = false,
  auto_open = false,
  auto_close = false,
  fold_open = "v",
  fold_closed = ">",
  indent_lines = false,
}

--------------------------------------------------------------------------------
-- Automatic LSP server installs
local lspconfig = require("lspconfig")

require("nvim-lsp-installer").setup {
  automatic_installation = true
}

--------------------------------------------------------------------------------
-- Treesitter
require('nvim-treesitter.configs').setup {
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
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
    -- { name = 'cmdline' },
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  }
})


local capabilities = require("cmp_nvim_lsp").default_capabilities()

--------------------------------------------------------------------------------
-- LSP servers configurations
local on_attach = function(_, bufnr)
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
  buf_map(bufnr, "n", "<Leader>gr", ":LspRefs<CR>")
  buf_map(bufnr, "n", "<Leader>gR", ":LspRename<CR>")
  buf_map(bufnr, "n", "<Leader>gt", ":LspTypeDef<CR>")
  buf_map(bufnr, "n", "<Leader>gg", ":LspHover<CR>")
  buf_map(bufnr, "n", "<Leader>gn", ":LspDiagPrev<CR>")
  buf_map(bufnr, "n", "<Leader>gp", ":LspDiagNext<CR>")
  buf_map(bufnr, "n", "<Leader>g<space>", ":LspCodeAction<CR>")
  buf_map(bufnr, "n", "<Leader>gl", ":LspDiagLine<CR>")
  buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
end

for _, lspserver in ipairs({ "intelephense", "tailwindcss", "vimls", "cssls" }) do
  lspconfig[lspserver].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig.tsserver.setup({
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "non-relative"
    }
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- TODO: move to typescript.nvim
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({})
    ts_utils.setup_client(client)

    on_attach(client, bufnr)
  end
})

lspconfig.lua_ls.setup({
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
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
  },
  on_attach = function()
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
})

--------------------------------------------------------------------------------
-- pears
require("pears").setup()

--------------------------------------------------------------------------------
-- gitsigns
require("gitsigns").setup({
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 200,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '-- <author> - <author_time:%Y-%m-%d> - <summary>',

})

--------------------------------------------------------------------------------
-- nvim-treesitter-context
require('treesitter-context').setup({
  enable = true,
  max_lines = 0,
  trim_scope = 'outer'
})

--------------------------------------------------------------------------------
-- obsidian.nvim
require("obsidian").setup({
  dir = "~/Sync/Obsidian",
  completion = {
    nvim_cmp = true,
  },
  use_advanded_uri = true,
  disable_frontmatter = true
})

vim.keymap.set(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)

--------------------------------------------------------------------------------
-- nvim-surround
require('nvim-surround').setup()

--------------------------------------------------------------------------------
-- numb
require('numb').setup()

--------------------------------------------------------------------------------
-- nvim-tree
-- require("nvim-tree").setup({
--   open_on_setup = false,
--   update_focused_file = {
--     enable = true
--   },
--   diagnostics = {
--     enable = true
--   },
--   renderer = {
--     indent_width = 1,
--   }
-- })
