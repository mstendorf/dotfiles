return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      file_ignore_patterns = { "bin/.*", "obj/.*", "__pycache__/*" },
      cache_picker = {
        num_pickers = 5,
      },
      history = {
        path = "~/.local/share/nvim/databases/telescope_history",
        limit = 100,
      },
      mappings = {
        i = {
          ["<S-Up>"] = function(...)
            require("telescope.actions").cycle_history_next(...)
          end,
          ["<S-Down>"] = function(...)
            require("telescope.actions").cycle_history_prev(...)
          end,
        },
      },
    },
  },
}
