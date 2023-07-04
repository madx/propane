vim.g.mapleader = ","

vim.keymap.set("n", "<Space>", ".")

-- Center after moving
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Swap ' and `
vim.keymap.set("n", "'", "`")
vim.keymap.set("n", "`", "'")

-- Copy/Paste
vim.keymap.set("v", "<Leader>C", [["+y"]], { desc = "Copy selected text to clipboard" })
vim.keymap.set("v", "<Leader>X", [["+d"]], { desc = "Cut selected text to clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>V", [["+p"]], { desc = "Paste text from clipboard" })

-- Copy current file path
vim.keymap.set("n", "<Leader>yp", ":let @+=@%<cr>", { desc = "Cop[y] current file [p]ath" })

-- Expand %% to dir of current file in command line
vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { desc = "Expand to dirname of current file" })

-- Reindent faster
vim.keymap.set("n", "<", "<<", { desc = "Remove one indentation level" })
vim.keymap.set("n", ">", ">>", { desc = "Indent one level" })

-- Commenting
vim.keymap.set("n", "<Leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<Leader>c", "gc", { remap = true })

-- Window management and navigation
vim.keymap.set("n", "<Leader>w", "<C-w>")
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
