local M = {}

M.opts = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "python",
        "javascript",
        "bash",
        "dockerfile",
        "go",
        "json",
        "markdown",
        "php",
        "regex",
        "sql",
        "scss",
        "css",
        "query",
    },
    autotag = {
        enable = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes =  {
            'html', "htmldjango", 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'xml', 'php', 'markdown', 'astro', 'glimmer', 'handlebars', 'hbs'
        }
    },
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
            }
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
    }
}
return M
