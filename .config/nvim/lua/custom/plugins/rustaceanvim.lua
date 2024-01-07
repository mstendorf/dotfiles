return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  version = "^3",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    {
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
    },
  },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        autoSetHints = true,
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
        },
      },
      -- inlay_hints = {
      --   highlight = "WinSeparator",
      -- },
      -- tools = {
      --   hover_actions = {
      --     auto_focus = true,
      --   },
      -- },
      server = {
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end,
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            assist = {
              importEnforceGranularity = true,
              -- importPrefix = "create",
            },
            cargo = { allFeatures = true },
            checkOnSave = {
              -- default: `cargo check`
              command = "clippy",
              allFeatures = true,
            },
            inlayHints = {
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
            },
          },
        },
      },
    }
  end,
}
