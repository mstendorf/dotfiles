return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
			vim.keymap.set("v", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
			vim.keymap.set("n", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
			vim.keymap.set("v", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
			vim.keymap.set("n", "<leader>gh", "<cmd> 0Gclog<CR>", { desc = "Git file history!" })
			vim.keymap.set("v", "<leader>gh", ":Gclog<CR>", { desc = "Git file history!" })
			vim.keymap.set(
				"n",
				"<leader>gch",
				"<cmd> Telescope git_file_history <CR>",
				{ desc = "Git commit history!" }
			)
			vim.keymap.set(
				"v",
				"<leader>gch",
				"<cmd> Telescope git_file_history <CR>",
				{ desc = "Git commit history!" }
			)
		end,
	},
	{
		"tpope/vim-fugitive",
		event = "BufRead",
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signcolumn = true,
			current_line_blame = true,
		},
		-- lazy=false
		event = "BufRead",
	},
	{
		"awerebea/git-worktree.nvim",
		branch = "handle_changes_in_telescope_api",
		event = "VeryLazy",
		config = function()
			require("git-worktree").setup()
			require("telescope").load_extension("git_worktree")
			-- git worktree
			vim.keymap.set(
				"n",
				"<leader>gw",
				"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees({ path_display = {}, })<CR>",
				{ desc = "Switch git worktree" }
			)
			vim.keymap.set("n", "<leader>gW", "<cmd>lua new_git_worktree() <CR>", { desc = "Create git worktree" })
		end,
	},
}
