return {
    -- {
    -- 	"kdheepak/lazygit.nvim",
    -- 	dependencies = {
    -- 		"nvim-lua/plenary.nvim",
    -- 	},
    -- 	event = "VeryLazy",
    -- 	config = function()
    -- 		vim.keymap.set("n", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
    -- 		vim.keymap.set("v", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
    -- 		vim.keymap.set("n", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
    -- 		vim.keymap.set("v", "<leader>gs", "<cmd> LazyGit<CR>", { desc = "Git status!" })
    -- 		vim.keymap.set("n", "<leader>gh", "<cmd> 0Gclog<CR>", { desc = "Git file history!" })
    -- 		vim.keymap.set("v", "<leader>gh", ":Gclog<CR>", { desc = "Git file history!" })
    -- 		vim.keymap.set(
    -- 			"n",
    -- 			"<leader>gch",
    -- 			"<cmd> Telescope git_file_history <CR>",
    -- 			{ desc = "Git commit history!" }
    -- 		)
    -- 		vim.keymap.set(
    -- 			"v",
    -- 			"<leader>gch",
    -- 			"<cmd> Telescope git_file_history <CR>",
    -- 			{ desc = "Git commit history!" }
    -- 		)
    -- 	end,
    -- },
    -- {
    -- 	"tpope/vim-fugitive",
    -- 	event = "BufRead",
    -- },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signcolumn = true,
            current_line_blame = true,
        },
        config = function()
            require("gitsigns").setup({
                signcolumn = true,
                current_line_blame = true,
                on_attach = function(bufnr)
                    local gitsigns = require("gitsigns")

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map("n", "]c", function()
                        if vim.wo.diff then
                            vim.cmd.normal({ "]c", bang = true })
                        else
                            gitsigns.nav_hunk("next")
                        end
                    end)

                    map("n", "[c", function()
                        if vim.wo.diff then
                            vim.cmd.normal({ "[c", bang = true })
                        else
                            gitsigns.nav_hunk("prev")
                        end
                    end)

                    -- Actions
                    map("n", "<leader>hs", gitsigns.stage_hunk)
                    map("n", "<leader>hr", gitsigns.reset_hunk)

                    map("v", "<leader>hs", function()
                        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end)

                    map("v", "<leader>hr", function()
                        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end)

                    map("n", "<leader>hS", gitsigns.stage_buffer)
                    map("n", "<leader>hR", gitsigns.reset_buffer)
                    map("n", "<leader>hp", gitsigns.preview_hunk)
                    map("n", "<leader>hi", gitsigns.preview_hunk_inline)

                    map("n", "<leader>hb", function()
                        gitsigns.blame_line({ full = true })
                    end)

                    map("n", "<leader>hd", gitsigns.diffthis)

                    map("n", "<leader>hD", function()
                        gitsigns.diffthis("~")
                    end)

                    map("n", "<leader>hQ", function()
                        gitsigns.setqflist("all")
                    end)
                    map("n", "<leader>hq", gitsigns.setqflist)

                    -- -- Toggles
                    -- map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
                    -- map("n", "<leader>td", gitsigns.toggle_deleted)
                    -- map("n", "<leader>tw", gitsigns.toggle_word_diff)

                    -- Text object
                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
                end,
            })
        end,
        -- lazy=false
        event = "BufRead",
    },
    {
        "awerebea/git-worktree.nvim",
        branch = "handle_changes_in_telescope_api",
        event = "VeryLazy",
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension("git_worktree")
            -- git worktree
            vim.keymap.set(
                "n",
                "<leader>gw",
                "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees({ path_display = {}, })<CR>",
                { desc = "Switch git worktree" }
            )
            vim.keymap.set("n", "<leader>gW", "<cmd>lua new_git_worktree() <CR>", { desc = "Create git worktree" })
        end,
    },
}
