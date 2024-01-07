return {
  "nvim-tree/nvim-tree.lua",
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
