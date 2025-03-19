return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, _)
                    return name == ".." or name == ".git"
                end,
            },
            use_default_keymaps = true,
            keymaps = {
                ["<C-h>"] = "<cmd> TmuxNavigateLeft<CR>",
                ["<C-l>"] = "<cmd> TmuxNavigateRight<CR>",
            },
        })
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
}
