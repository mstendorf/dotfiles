local M = {}

M.opts = {
    ensure_installed = {
        "csharpier",
        "prettier",
        "shellcheck",
        "lua-language-server",
        "black",
        "html-lsp",
        "debugpy",
        -- "mypy",
        "pylint",
        "pyright", -- python LSP
        "typescript-language-server", -- JS LSP
        "omnisharp", -- c# LSP
        "gopls",
        "gofumpt",
        "djlint",
        "goimports",
    }
}
return M
