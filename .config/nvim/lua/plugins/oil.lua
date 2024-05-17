return {
    "stevearc/oil.nvim",
    opts = {
        keymaps = {
            ["<C-h>"] = "<cmd> TmuxNavigateLeft<CR>",
            ["<C-l>"] = "<cmd> TmuxNavigateRight<CR>",
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
}
