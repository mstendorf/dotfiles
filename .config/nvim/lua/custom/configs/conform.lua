local options ={
    formatters ={

        prettier = {
            extra_args = {
                "--tab-width=4",
                "--print-width=110",
            }
        },

        golines = {
            extra_args = {
                "--max-len=180",
                "--base-formatter=gofumpt",
            },
        }
    },
    formatters_by_ft = {
        lua = {"stylua"},
        cs = {"csharpier"},
        javascript = {"prettierd"},
        go = {"gofmt", "goimports"},
        tpl = {"djlint"},
        python = {"black", "isort"},
        html = {"prettier"},
        htmldjango = {"prettier"},
        css = {"prettier"},
        markdown = {"prettier"},
        typescript = {"prettier"},
        typescriptreact = {"prettier"},
        javascriptreact = {"prettier"},
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true
    }
}
require("conform").setup(options)
