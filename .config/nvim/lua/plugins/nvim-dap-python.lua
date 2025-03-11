return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    keys = {
        { "<M-b>", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" } },
        {
            "<leader>drt",
            function()
                require("dap-python").test_method()
            end,
            { desc = "Test method" },
        },
    },
    config = function(_, _)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("dap-python").test_runner = "pytest"
        -- require("core.utils").load_mappings "dap_python"
        -- vim.keymap.set("n", "<leader>drt", function()
        --     require("dap-python").test_method()
        -- end, { silent = true, desc = "Test method" })
    end,
}
