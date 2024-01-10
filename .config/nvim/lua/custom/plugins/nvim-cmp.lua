return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local M = require "plugins.configs.cmp"
    table.insert(M.sources, { name = "crates" })
    return M
  end,
}
