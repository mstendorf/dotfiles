return {
  "mfussenegger/nvim-dap",
  config = function(_, _)
    require("core.utils").load_mappings "dap"
  end,
}
