return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
        "windwp/nvim-ts-autotag",
    },
    lazy = false,
    config = function()
        local ensure_installed = {
            "vim", "lua", "html", "python", "javascript", "bash",
            "dockerfile", "go", "gomod", "gosum", "gotmpl", "gowork",
            "comment", "json", "markdown", "php", "regex", "sql",
            "scss", "css", "query",
        }
        local ts_config = require("nvim-treesitter.config")
        local installed = ts_config.get_installed()
        local missing = vim.tbl_filter(function(lang)
            return not vim.list_contains(installed, lang)
        end, ensure_installed)
        if #missing > 0 then
            require("nvim-treesitter.install").install(missing)
        end

        require("nvim-treesitter-textobjects").setup({
            select = { lookahead = true },
        })

        local select = require("nvim-treesitter-textobjects.select")
        for key, capture in pairs({
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["a,"] = "@parameter.outer",
            ["i,"] = "@parameter.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.inner",
        }) do
            vim.keymap.set({ "x", "o" }, key, function()
                select.select_textobject(capture, "textobjects")
            end, { desc = "Textobject " .. capture })
        end

        local swap = require("nvim-treesitter-textobjects.swap")
        vim.keymap.set("n", "<leader>a", function()
            swap.swap_next("@parameter.inner", "textobjects")
        end, { desc = "Swap next parameter" })
        vim.keymap.set("n", "<leader>A", function()
            swap.swap_previous("@parameter.inner", "textobjects")
        end, { desc = "Swap previous parameter" })
    end,
}
