local code_files = { "rust", "python", "javascript", "javascriptreact", "htmldjango", "html", "css", "cs", "go", "lua" }
return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Trouble",
  config = function()
    require("trouble").setup()
  end,
  opts = {
    mode = "workspace_diagnostics",
  },
  ft = code_files,
}
