return {
    "mfussenegger/nvim-dap",
    -- config = function(_, _)
    --     require("nvchad.core.utils").load_mappings("dap")
    -- end,
    config = function()
        local dap = require("dap")
        vim.keymap.set({ "n", "v", "i" }, "<C-M-j>", function()
            dap.step_over()
        end, { silent = true, desc = "Step over" })
        vim.keymap.set({ "n", "v", "i" }, "<C-M-h>", function()
            dap.step_out()
        end, { silent = true, desc = "Step out" })
        vim.keymap.set({ "n", "v", "i" }, "<C-M-l>", function()
            dap.step_into()
        end, { silent = true, desc = "Step into" })
        vim.keymap.set({ "n", "v", "i" }, "<C-M-k>", function()
            dap.step_back()
        end, { silent = true, desc = "Step back" })

        vim.keymap.set("n", "<leader>dbg", function()
            require("dap").continue()
        end, { desc = "Start debugging" })

        vim.keymap.set("n", "<leader>drc", function()
            require("dat").run_to_cursor()
        end, { silent = true, desc = "Run to cursor" })

        vim.keymap.set("n", "<M-b>", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
    end,
}
