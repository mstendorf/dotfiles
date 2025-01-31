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
    end,
}
