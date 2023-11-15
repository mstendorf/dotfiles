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
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier" },
    javascript = { "prettier" },
    go = { "gofmt", "goimports" },
    tpl = { "djlint" },
    python = { "ruff_format" },
    html = { "djlint" },
    htmldjango = { "djlint" },
    css = { "prettier" },
    markdown = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    yaml = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}
require("conform").setup(options)
