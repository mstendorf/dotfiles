return {
    "awerebea/git-worktree.nvim",
    branch = "handle_changes_in_telescope_api",
    event = "VeryLazy",
    config = function()
        require("git-worktree").setup()
        require("telescope").load_extension("git_worktree")
    end,
}
