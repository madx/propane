local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Leader>oo", builtin.git_files, { desc = "Search through Git files" })
vim.keymap.set("n", "<Leader>of", builtin.find_files, { desc = "Search through all files" })
vim.keymap.set("n", "<Leader>og", builtin.live_grep, { desc = "Search through grep results" })
vim.keymap.set("n", "<Leader>ob", builtin.buffers, { desc = "Search through open buffers" })
vim.keymap.set("n", "<Leader>oh", builtin.help_tags, { desc = "Search through help tags" })
vim.keymap.set("n", "<Leader>ok", builtin.keymaps, { desc = "Search through keymaps" })

vim.keymap.set("n", "<Leader>olr", builtin.lsp_references, { desc = "Lists LSP references for word under the cursor" })
vim.keymap.set(
  "n",
  "<Leader>ole",
  builtin.diagnostics,
  { desc = "Lists Diagnostics for all open buffers or a specific buffer" }
)
vim.keymap.set("n", "<Leader>oli", builtin.lsp_implementations, {
  desc = "Goto the implementation of the word under the cursor if there's only one",
})
vim.keymap.set("n", "<Leader>old", builtin.lsp_definitions, {
  desc = "Goto the definition of the word under the cursor",
})
vim.keymap.set("n", "<Leader>olt", builtin.lsp_type_definitions, {
  desc = "Goto the definition of the type of the word under the cursor",
})

vim.keymap.set("n", "<C-k>", builtin.commands, { desc = "Search through commands" })
vim.keymap.set({ "n", "v" }, "<Leader>S", builtin.grep_string, { desc = "Search current word" })

telescope.load_extension("fzf")
