return {
    "windwp/nvim-ts-autotag",
    -- ft = {
    --     "jinja2",
    --     "html",
    --     "htmldjango",
    --     "html.jinja",
    --     "css",
    --     "javascript",
    --     "typescript",
    --     "javascriptreact",
    --     "typescriptreact",
    --     "svelte",
    --     "vue",
    --     "tsx",
    --     "jsx",
    --     "rescript",
    --     "xml",
    --     "php",
    --     "markdown",
    --     "astro",
    --     "glimmer",
    --     "handlebars",
    --     "hbs",
    -- },
    config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false, -- Auto close on trailing </
            },
            aliases = {
                ["html.jinja"] = "html",
                ["htmldjango"] = "html",
            },
        })
    end,
}
