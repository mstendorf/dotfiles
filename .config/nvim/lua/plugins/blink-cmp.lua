return {
	{ import = "nvchad.blink.lazyspec" },
	{
		"saghen/blink.cmp",
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				["<CR>"] = { "accept", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f"] = { "scroll_documentation_down", "fallback" },
			},
			signature = {
				-- enabled = false,
				trigger = {
					enable = false,
				},
			},
			completion = {
				ghost_text = { enabled = false },
				menu = {
					draw = {
						padding = { 0, 1 },
						align_to = "kind_icon",
					},
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
