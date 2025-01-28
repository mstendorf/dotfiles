require("nvchad.mappings")
-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>gt")
nomap("n", "<leader>cm")
nomap("n", "<tab>")
nomap("n", "<leader>e")
nomap("n", "<leader>n")

local map = vim.keymap.set

-- toggle inlay hints
map("n", "<leader>ih", function()
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
map("x", "<leader>p", '"_dP', { desc = "Paste over highlighted text and preserve clipboard" })
map("n", "Q", "<nop>")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = "Replace word under cursor" })
map("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { desc = "Make current file executeable" })
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centered while scrolling" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered while scrolling" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "K", function()
	require("pretty_hover").hover()
end, { desc = "LSP hover" })

-- insert mode bindings
map("i", "<C-c>", "<Esc>", { desc = "Remap for vertical edit to handle C-c" })
map("i", "<C-a>", "<ESC>^i", { desc = "Beginning of line" })

-- centered search
map("n", "n", "nzz", { desc = "Centered jumps in search mode" })
map("n", "N", "Nzz", { desc = "Centered jumps in search mode" })
map("n", "*", "*zz", { desc = "Center search term on init" })

-- fancy tmux integration
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>", { desc = "run tmux-sessionizer" })

-- cullular automaton
map("n", "<leader>fml", function()
	require("cellular-automaton").start_animation("make_it_rain")
end, { desc = "cellular-automaton make_it_rain" })

map("n", "<leader>fu", function()
	require("cellular-automaton").start_animation("scramble")
end, { desc = "cellular-automaton scramble" })
map("n", "<leader>fuu", function()
	require("cellular-automaton").start_animation("game_of_life")
end, { desc = "cellular-automaton game_of_life" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- bindings for python debugging
map("n", "<leader>dbp", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dbg", function()
	require("dap").continue()
end, { desc = "Start debugging" })
map("n", "<leader>dpr", function()
	require("dap-python").test_method()
end, { desc = "Debug python run" })

-- trouble
map("n", "<leader>ww", function()
	require("trouble").toggle("workspace_diagnostics")
end, { desc = "toggle trouble with workspace diagnostics", silent = true, noremap = true })

-- zen mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true, noremap = true, desc = "Zen mode" })
-- visual mode bindings
map("v", "<leader>ca", function()
	require("actions-preview").code_actions()
end, { desc = "Code actions" })

-- snippets
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		return ls.expand_or_jump()
	end
end, { silent = true, desc = "Expand or jump snippet" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		return ls.jump(-1)
	end
end, { silent = true, desc = "Jump to prev snippet" })

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
