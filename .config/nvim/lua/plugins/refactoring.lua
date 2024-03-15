local code_files = { "python", "javascript", "javascriptreact", "htmldjango", "html", "css", "cs", "go", "lua" }
return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
  ft = code_files,
  -- lazy=true
}
