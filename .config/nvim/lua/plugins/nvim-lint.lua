return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        -- lint.linters.rust_analyzer = {
        --   cmd = "rust-analyzer",
        --   args = { "clippy" },
        --   stdin = true,
        --   append_name = true,
        --   -- debounce = 100,
        --   -- offsetLine = 0,
        --   -- offsetColumn = 0,
        --   -- formatLines = 1,
        --   -- formatPattern = {
        --   --   [[^.*:(\d+):(\d+):\s*(.*)$]],
        --   --   {
        --   --     line = 1,
        --   --     column = 2,
        --   --     message = 3,
        --   --   },
        --   -- },
        --   -- securities = {
        --   --   error = "error",
        --   --   warning = "warning",
        --   --   note = "info",
        --   -- },
        -- }
        -- local mypy = lint.linters.mypy
        -- mypy.args = { "--implicit-reexport" }
        lint.linters_by_ft = {
            python = { "ruff", "mypy" },
            javascript = { "djlint" },
            htmldjango = { "djlint" },
            html = { "djlint" },
            css = { "stylelint" },
            -- rust = { "rust_analyzer" },
        }
    end,
}
