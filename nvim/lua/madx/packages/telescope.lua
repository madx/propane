local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
})

local nmap = function(keys, func, desc)
  if desc then
    desc = "Telescope: " .. desc
  end

  vim.keymap.set("n", keys, func, { desc = desc })
end

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  if current_file == "" then
    current_dir = cwd
  else
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end
vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

local function telescope_live_grep_open_files()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end

nmap("<leader><Space>", builtin.resume, "Resume Search")
nmap("<Leader>or", builtin.oldfiles, "[R]ecent file")
nmap("<Leader>og", builtin.git_files, "Open [G]it file")
nmap("<Leader>of", builtin.find_files, "Open [F]ile from current working directory")
nmap("<Leader>ob", builtin.buffers, "Open [B]uffer")
nmap("<Leader>oh", builtin.help_tags, "Open [H]elp")

nmap("<Leader>sg", builtin.live_grep, "Search [g]rep results")
nmap("<leader>so", telescope_live_grep_open_files, "Search in open [f]iles (live grep)")
nmap("<leader>sp", ":LiveGrepGitRoot<cr>", "Search [P]roject (live grep on Git root)")
nmap("<Leader>st", builtin.builtin, "Search builtin [T]elescopes")
nmap("<Leader>sk", builtin.keymaps, "Search [k]eymaps")
nmap("<Leader>sd", builtin.diagnostics, "Search LSP [D]iagnostics")
nmap("<leader>sb", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, "Search current [b]uffer")


nmap("<Leader>gr", builtin.lsp_references, "[G]o to LSP [R]eference for word under the cursor")
nmap("<Leader>gi", builtin.lsp_implementations, "[G]o to LSP [I]mplementations")
nmap("<Leader>gd", builtin.lsp_definitions, "[G]o to LSP [D]efinitions")
nmap("<Leader>gt", builtin.lsp_type_definitions, "[G]o to LSP [T]ype definition")

nmap("<C-k>", builtin.commands, "Command palette")
nmap("<Leader>S", builtin.grep_string, "[S]earch current word")

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
