return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- {
        --     "isak102/telescope-git-file-history.nvim",
        --     dependencies = { "tpope/vim-fugitive" },
        -- },
        "debugloop/telescope-undo.nvim",
    },
    opts = {
        defaults = {
            prompt_prefix = " ",
            file_ignore_patterns = { "bin/.*", "obj/.*", "__pycache__/*" },
            cache_picker = {
                num_pickers = 5,
            },
            history = {
                path = "~/.local/share/nvim/databases/telescope_history",
                limit = 100,
            },
            mappings = {
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
                i = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer,
                    ["<S-Up>"] = function(...)
                        require("telescope.actions").cycle_history_next(...)
                    end,
                    ["<S-Down>"] = function(...)
                        require("telescope.actions").cycle_history_prev(...)
                    end,
                },
            },
        },
    },
    -- config = function()
    --     require("telescope").setup(require("telescope").load_extension("git_file_history"))
    -- end,
}
