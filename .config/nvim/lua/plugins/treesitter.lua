return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "vim",
            "lua",
            "html",
            "python",
            "javascript",
            "bash",
            "dockerfile",
            "go",
            "gomod",
            "gosum",
            "gotmpl",
            "gowork",
            "comment",
            "json",
            "markdown",
            "php",
            "regex",
            "sql",
            "scss",
            "css",
            "query",
        },
        auto_install = true,
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
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
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
    lazy = false,
}
