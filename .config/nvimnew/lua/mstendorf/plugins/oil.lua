return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			preview = {
				win_options = {
					winhl = "Normal:Normal,Float:Float",
					winblend = 0,
				},
			},
			float = {
				win_options = {
					winblend = 0,
				},
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			use_default_keymaps = true,
			keymaps = {
				["<C-h>"] = "<cmd> TmuxNavigateLeft<CR>",
				["<C-l>"] = "<cmd> TmuxNavigateRight<CR>",
			},
		})
	end,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
}
