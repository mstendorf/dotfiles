local code_files =
    { "python", "javascript", "javascriptreact", "htmldjango", "jinja", "html", "css", "cs", "go", "lua" }
return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup()
        -- refactoring
        vim.keymap.set("n", "<leader>riv", ":Refactor inline_var", { desc = "Refactor inline variable" })
        vim.keymap.set("n", "<leader>rif", ":Refactor inline_func", { desc = "Refactor inline function" })
        vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactor extract block" })
        vim.keymap.set(
            "n",
            "<leader>rbf",
            ":Refactor extract_block_to_file",
            { desc = "Refactor extract block to file" }
        )
        vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Refactor extract method" })
        vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactor extract to other file" })
        vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactor extract variable" })
        vim.keymap.set("x", "<leader>ri", ":Refactor inline_var", { desc = "Refactor inline variable" })
    end,
    ft = code_files,
    -- lazy=true
}
