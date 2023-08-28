local M = {}

M.opts = {
  ensure_installed = {
    "csharpier",
    "prettier",
    "shellcheck",
    "lua-language-server",
    "black",
    "debugpy",
    -- "mypy",
    "pylint",
    "pyright", -- python LSP
    "typescript-language-server", -- JS LSP
    "omnisharp", -- c# LSP
  }
}
return M
