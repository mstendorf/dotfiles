local M = {}

M.base46 = {
	transparency = true,
	theme = "gruvbox",
}
M.ui = {
	cmp = {
		style = "atom",
	},
	tabufline = {
		enabled = false,
	},
	statusline = {
		theme = "minimal",
		separator_style = "round",
		order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
	},
}

return M
