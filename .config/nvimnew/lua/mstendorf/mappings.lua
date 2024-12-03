vim.g.mapleader = " "

local map = vim.keymap.set

-- toggle inlay hints
map("n", "<leader>lh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

-- som basic qol remaps
map("i", "<C-c>", "<Esc>", { desc = "Remap for vertical edit to handle C-c" })
map("n", "J", "mzJ`z", { desc = "Join line with cursor in place" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
map("n", "<leader>d", '"_d', { desc = "Delete line to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>d", '"_d', { desc = "Delete line to system clipboard" })
map("n", "Q", "<nop>")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = "Replace word under cursor" })
map("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { desc = "Make current file executeable" })
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centered while scrolling" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered while scrolling" })

-- commenting
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })

-- centered search
map("n", "n", "nzz", { desc = "Centered jumps in search mode" })
map("n", "N", "Nzz", { desc = "Centered jumps in search mode" })
map("n", "*", "*zz", { desc = "Center search term on init" })

-- undo tree
map("n", "<leader>u", "<cmd> UndotreeToggle<CR>", { desc = "Undotree toggle" })

-- git bindings
map("n", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
map("v", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
map("n", "<leader>gh", "<cmd> 0Gclog<CR>", { desc = "Git file history!" })
map("v", "<leader>gh", ":Gclog<CR>", { desc = "Git file history!" })
map("n", "<leader>gch", "<cmd> Telescope git_file_history <CR>", { desc = "Git commit history!" })
map("v", "<leader>gch", "<cmd> Telescope git_file_history <CR>", { desc = "Git commit history!" })

-- git worktree
map(
	"n",
	"<leader>gw",
	"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees({ path_display = {}, })<CR>",
	{ desc = "Switch git worktree" }
)
map("n", "<leader>gW", "<cmd>lua new_git_worktree() <CR>", { desc = "Create git worktree" })

-- fancy tmux integration
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>", { desc = "run tmux-sessionizer" })

-- refactoring
map("n", "<leader>riv", ":Refactor inline_var", { desc = "Refactor inline variable" })
map("n", "<leader>rif", ":Refactor inline_func", { desc = "Refactor inline function" })
map("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactor extract block" })
map("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Refactor extract block to file" })
map("x", "<leader>re", ":Refactor extract ", { desc = "Refactor extract method" })
map("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactor extract to other file" })
map("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactor extract variable" })
map("x", "<leader>ri", ":Refactor inline_var", { desc = "Refactor inline variable" })

-- oil
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- debugging
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })

-- trouble
map("n", "<leader>ww", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "toggle trouble with workspace diagnostics", silent = true, noremap = true })

-- lsp
map("n", "<leader>ca", function()
	require("actions-preview").code_actions()
end, { desc = "Code actions" })
map("v", "<leader>ca", function()
	require("actions-preview").code_actions()
end, { desc = "Code actions" })

-- copilot
-- map("i", "<M-CR>", function()
-- 	vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
-- end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- typo fixes
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev w1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qa! qa!
cnoreabbrev Qall! qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev wq1 wq!
cnoreabbrev Wq1 wq!
cnoreabbrev wQ1 wq!
cnoreabbrev WQ1 wq!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
]])
