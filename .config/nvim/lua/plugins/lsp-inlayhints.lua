return {
  "lvimuser/lsp-inlayhints.nvim",
  opts = {
    inlay_hints = {
      -- highlight = "NonText",
      parameter_hints = {
        remove_colon_start = true,
      },
      type_hints = {
        prefix = " => ",
        remove_colon_start = true,
        remove_colon_end = true,
      },
    },
  },
}
