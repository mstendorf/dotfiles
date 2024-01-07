return {
  "abecodes/tabout.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("tabout").setup {}
  end,
}
