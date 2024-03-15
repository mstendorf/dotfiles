local plugins = {

  -- {
  --     "aznhe21/actions-preview.nvim",
  --     config = function () end,
  --     event = "VeryLazy"
  -- },
  -- {
  --     "nvim-treesitter/nvim-treesitter-textobjects",
  --     opts = require("custom.configs.treesitter-textobjects").opts,
  --     config = function ()
  --         require("nvim-treesitter.configs")
  --     end
  -- },
  -- {
  --     "jose-elias-alvarez/null-ls.nvim",
  --     ft = { "python", "javascript", "htmldjango", "html", "css", "cs", "go" },
  --     opts = function ()
  --         return require "custom.configs.null-ls"
  --     end
  -- },
  -- pretty diagnostics panel

  -- {
  --   "simrat39/rust-tools.nvim",
  --   ft = "rust",
  --   dependencies = "neovim/nvim-lspconfig",
  --   opts = function()
  --     return require "custom.configs.rust-tools"
  --   end,
  --   config = function(_, opts)
  --     require("rust-tools").setup(opts)
  --   end,
  -- },
}

return plugins
