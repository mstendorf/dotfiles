local M = {}

M.opts = {
    filters = {
      custom = { 
      "__pycache__", 
      ".git*",
      ".vscode",
      ".mypy_cache",
      ".ruff_cache",
    }
    }
}


return M
