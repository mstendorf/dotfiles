return {
    "williamboman/mason.nvim",
    opts = {
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
            "ts_ls",
            "omnisharp", -- c# LSP
            "gopls",
            "gofumpt",
            "djlint",
            "eslint_d",
            "goimports",
            "clangd",
            -- "rust-analyzer",
            -- "rustfmt",
        },
    },
}
