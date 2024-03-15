local code_files = { "python", "javascript", "javascriptreact", "htmldjango", "html", "css", "cs", "go", "lua" }
return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Trouble",
  config = function()
    require("trouble").setup()
  end,
  ft = code_files,
}
