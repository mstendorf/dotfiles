return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- {
        --     "isak102/telescope-git-file-history.nvim",
        --     dependencies = { "tpope/vim-fugitive" },
        -- },
        "debugloop/telescope-undo.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
    config = function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        require("telescope").setup({
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
                        ["<c-d>"] = actions.delete_buffer,
                    },
                    i = {
                        ["<c-d>"] = actions.delete_buffer,
                        ["<S-Up>"] = function(...)
                            actions.cycle_history_next(...)
                        end,
                        ["<S-Down>"] = function(...)
                            actions.cycle_history_prev(...)
                        end,
                    },
                },
            },
            extensions = {
                fzf = {},
            },
        })

        vim.keymap.set(
            "n",
            "<leader>t",
            "<cmd> Telescope builtin <CR>",
            { desc = "List telescope functions as fuzzy search" }
        )
        vim.keymap.set(
            "n",
            "<leader>fa",
            "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
            { desc = "telescope find all files" }
        )
        vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files follow=true <CR>", { desc = "Find files" })
        vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Find words" })
        vim.keymap.set("n", "<leader>fW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fc", "<cmd> Telescope commands <CR>", { desc = "Find in current buffer" })
        vim.keymap.set("n", "<leader>fn", "<cmd> Telescope lsp_document_symbols ignore_symbols=variable,module <CR>")
        vim.keymap.set("n", "<leader>ft", "<cmd> Telescope help_tags <CR>", { desc = "List help tags of nvim" })
        vim.keymap.set("n", "<leader>gf", "<cmd> Telescope git_files <CR>", { desc = "Find files tracked by git" })
        vim.keymap.set("n", "<leader>gch", "<cmd> Telescope git_file_history <CR>", { desc = "Git commit history!" })
        -- vim.keymap.set("n", "gr", "<cmd> Telescope lsp_references<CR>", { desc = "lsp references" })
    end,
}
