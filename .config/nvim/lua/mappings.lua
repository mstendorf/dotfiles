require("nvchad.mappings")
-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>gt")
nomap("n", "<leader>cm")
-- nomap("n", "<leader>ca")
nomap("n", "<leader>lf")
nomap("n", "<tab>")

-- add yours here
local map = vim.keymap.set
-- Comment
-- map({ "n", "v" }, "<leader>/", function()
-- require("Comment.api").toggle.linewise.current()
-- end, { desc = "Comment Toggle" })
map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

map(
    "v",
    "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "Comment Toggle" }
)
map("n", "<leader>fm", function()
    require("conform").format()
end, { desc = "File Format with conform" })
map("n", "J", "mzJ`z", { desc = "Join line with cursor in place" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
map("n", "<leader>d", '"_d', { desc = "Delete line to system clipboard" })
map("n", "Q", "<nop>")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", { desc = "Replace word under cursor" })
map("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { desc = "Make current file executeable" })
map("n", "<C-d>", "<C-d>zz", { desc = "Keep cursor centered while scrolling" })
map("n", "<C-u>", "<C-u>zz", { desc = "Keep cursor centered while scrolling" })
-- tmux navigation settings overwriting what nvchad overwrote from vim, going full circle here
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })
-- telescope bindings
map("n", "<leader>t", "<cmd> Telescope builtin <CR>", { desc = "List telescope functions as fuzzy search" })
map("n", "<leader>ff", "<cmd> Telescope find_files follow=true <CR>", { desc = "Find files" })
map("n", "<leader>fc", "<cmd> Telescope commands <CR>", { desc = "Find in current buffer" })
map(
    "n",
    "<leader>fn",
    "<cmd> Telescope lsp_document_symbols ignore_symbols=variable,module <CR>",
    { desc = "Find in current buffer" }
)
map("n", "<leader>ft", "<cmd> Telescope help_tags <CR>", { desc = "List help tags of nvim" })
-- ["<leader>u"] = { "<cmd> Telescope undo <CR>", "Undotreee toggle" },
map("n", "<leader>u", "<cmd> UndotreeToggle<CR>", { desc = "Undotreee toggle" })
map("n", "<leader>gf", "<cmd> Telescope git_files <CR>", { desc = "Find files tracked by git" })

-- git bindings
map("n", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
map("n", "<leader>gh", "<cmd> 0Gclog<CR>", { desc = "Git file history!" })
map("n", "<leader>gch", "<cmd> Telescope git_file_history <CR>", { desc = "Git commit history!" })

map("n", "gr", "<cmd> Telescope lsp_references<CR>", { desc = "lsp references" })
map("n", "gd", "<cmd> Telescope lsp_definitions<CR>", { desc = "lsp definitions" })

-- fancy tmux integration
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>", { desc = "run tmux-sessionizer" })

map("n", "<leader>riv", ":Refactor inline_var", { desc = "Refactor inline variable" })
map("n", "<leader>rif", ":Refactor inline_func", { desc = "Refactor inline function" })
map("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactor extract block" })
map("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Refactor extract block to file" })
map("n", "<leader>db", "<cmd> DBUIToggle<CR>", { desc = "Toggle dadbod databse ui" })
map("n", "<leader>fi", "ggVG=", { desc = "Reindent file" })

map("n", "<leader>fml", function()
    require("cellular-automaton").start_animation("make_it_rain")
end, { desc = "cellular-automaton make_it_rain" })

map("n", "<leader>fu", function()
    require("cellular-automaton").start_animation("scramble")
end, { desc = "cellular-automaton scramble" })
map("n", "<leader>fuu", function()
    require("cellular-automaton").start_animation("game_of_life")
end, { desc = "cellular-automaton game_of_life" })
-- centered search
map("n", "n", "nzz", { desc = "Centered jumps in search mode" })
map("n", "N", "Nzz", { desc = "Centered jumps in search mode" })
map("n", "*", "*zz", { desc = "Center search term on init" })
map("n", "<leader>x", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })
map("n", "K", function()
    require("pretty_hover").hover()
end, { desc = "LSP hover" })
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- harpoon
map("n", "<leader>m", function()
    require("harpoon"):list():append()
end, { desc = "Add file to harpoon" })
map("n", "<leader>h", function()
    require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toggle harpoon menu" })
map("n", "<leader>j", function()
    require("harpoon"):list():select(1)
end, { desc = "Go to harpoon mark 1" })
map("n", "<leader>k", function()
    require("harpoon"):list():select(2)
end, { desc = "Go to harpoon mark 2" })
map("n", "<leader>l", function()
    require("harpoon"):list():select(3)
end, { desc = "Go to harpoon mark 3" })
map("n", "<leader>;", function()
    require("harpoon"):list():select(4)
end, { desc = "Go to harpoon mark 4" })
-- bindings for python debugging
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dpr", function()
    require("dap-python").test_method()
end, { desc = "Debug python run" })
-- trouble
map("n", "<leader>ww", function()
    require("trouble").toggle("workspace_diagnostics")
end, { desc = "toggle trouble with workspace diagnostics", silent = true, noremap = true })
map("n", "<leader>ca", function()
    require("actions-preview").code_actions()
end, { desc = "Code actions" })

-- visual mode bindings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>d", '"_d', { desc = "Delete line to system clipboard" })
map("v", "<leader>gh", ":Gclog<CR>", { desc = "Git file history!" })
map("v", "<leader>ca", function()
    require("actions-preview").code_actions()
end, { desc = "Code actions" })

map("x", "<leader>p", '"_dP', { desc = "Paste over highlighted text and preserve clipboard" })
map("x", "<leader>re", ":Refactor extract ", { desc = "Refactor extract method" })
map("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactor extract to other file" })
map("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactor extract variable" })
map("x", "<leader>ri", ":Refactor inline_var", { desc = "Refactor inline variable" })

-- insert mode bindings
map("i", "<C-c>", "<Esc>", { desc = "Remap for vertical edit to handle C-c" })
map("i", "<C-a>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<M-CR>", function()
    vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })
