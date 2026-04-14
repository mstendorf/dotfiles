return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        local mypy = lint.linters.mypy
        mypy.args = {
            "--show-column-numbers",
            "--show-error-end",
            "--hide-error-codes",
            "--hide-error-context",
            "--no-color-output",
            "--no-error-summary",
            "--no-pretty",
            "--python-executable",
            function()
                local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
                return virtual .. "/bin/python"
            end,
        }
        lint.linters_by_ft = {
            python = { "ruff", "mypy" },
            htmldjango = { "djlint" },
            html = { "djlint" },
            css = { "stylelint" },
        }
    end,
}
