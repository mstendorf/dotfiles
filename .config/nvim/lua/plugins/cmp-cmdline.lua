return {
  "hrsh7th/cmp-cmdline",
  dependencies = {
    "hrsh7th/cmp-buffer",
  },
  event = "VeryLazy",
  config = function()
    local cmp = require "cmp"
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}
