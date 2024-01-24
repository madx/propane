local which_key = require("which-key")

-- document existing key chains
which_key.register({
  ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
  ["<leader>o"] = { name = "[O]pen", _ = "which_key_ignore" },
  ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
  ["<leader>g"] = { name = "[G]o to", _ = "which_key_ignore" },
})

-- document visual mode key chains
which_key.register({
  ["<leader>"] = { name = "VISUAL <leader>" },
  ["<leader>h"] = { "Git [H]unk" },
}, { mode = "v" })

