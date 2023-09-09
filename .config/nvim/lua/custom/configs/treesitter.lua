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
        filetypes = {"html"}
    }
}
return M
