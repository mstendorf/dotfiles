local M = {}

M.opts = {
    ensure_installed = {
        "stylua",
        "html-lsp",
        "css-lsp",
        "csharpier",
        "prettier",
        "shellcheck",
        "lua-language-server",
        "black",
        "debugpy",
        -- "mypy",
        "pylint",
        "pyright", -- python LSP
        "ruff",
        "ruff-lsp",
        "typescript-language-server", -- JS LSP
        "omnisharp", -- c# LSP
        "gopls",
        "gofumpt",
        "djlint",
        "goimports",
    }
}
return M
