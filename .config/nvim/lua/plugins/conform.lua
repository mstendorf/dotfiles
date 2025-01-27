local code_files =
    { "python", "javascript", "javascriptreact", "jinja", "htmldjango", "html", "css", "cs", "go", "lua" }
return {
    "stevearc/conform.nvim",
    config = function()
        local options = {
            formatters = {

                prettier = {
                    extra_args = {
                        "--tab-width=4",
                        "--print-width=110",
                    },
                },

                golines = {
                    extra_args = {
                        "--max-len=180",
                        "--base-formatter=gofumpt",
                    },
                },
                stylua = {
                    extra_args = {
                        "--config-path ~/.config/stylua.toml",
                    },
                },
            },
            formatters = {
                ruff_organize_imports = {
                    command = "ruff",
                    args = {
                        "check",
                        "--force-exclude",
                        -- "--select=I001",
                        "--fix",
                        "--exit-zero",
                        "--stdin-filename",
                        "$FILENAME",
                        "-",
                    },
                    stdin = true,
                    cwd = require("conform.util").root_file({
                        "pyrightconfig.json",
                        "pyproject.toml",
                        "ruff.toml",
                        ".ruff.toml",
                    }),
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                cs = { "csharpier" },
                javascript = { "prettier" },
                go = { "gofmt", "goimports" },
                tpl = { "djlint" },
                python = { "ruff_format", "ruff_organize_imports" },
                html = { "djlint" },
                htmldjango = { "djlint" },
                css = { "prettier" },
                markdown = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
                yaml = { "prettier" },
                rust = { "rustfmt" },
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_fallback = true,
            },
        }
        require("conform").setup(options)
    end,
    ft = code_files,
}
