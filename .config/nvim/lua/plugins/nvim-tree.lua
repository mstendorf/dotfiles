return {
	"nvim-tree/nvim-tree.lua",
	enabled = false, -- disable it since we do not use that here
	opts = {
		filters = {
			custom = {
				"__pycache__",
				".git*",
				".vscode",
				".mypy_cache",
				".ruff_cache",
			},
		},
	},
}
