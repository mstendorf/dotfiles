local code_files = { "python", "javascript", "javascriptreact", "htmldjango", "html", "css", "cs", "go", "lua" }
local plugins = {
  {
    "Aasim-A/scrollEOF.nvim",
    config = function()
      require("scrollEOF").setup()
    end,
    event = "BufRead",
  },
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "python", "javascript", "typescript" },
  },
  {
    "eandrju/cellular-automaton.nvim",
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local config = require "plugins.configs.lspconfig"

      require("go").setup {
        lsp_cfg = {
          capabilities = config.capabilities,
          on_attach = config.on_attach,
        },
        lsp_gofumpt = true,
        lsp_keymaps = false,
        trouble = true,
        luasnip = true,
        lsp_inlay_hints = {
          enable = true,
        },
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufRead",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "github/copilot.vim",
    -- lazy = false,
    event = "LspAttach",
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("tabout").setup {}
    end,
  },
  -- {
  --     "aznhe21/actions-preview.nvim",
  --     config = function () end,
  --     event = "VeryLazy"
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.treesitter").opts,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup {}
    end,
  },
  {
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
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = require("custom.configs.gitsigns").opts,
    -- lazy=false
    event = "BufRead",
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("custom.configs.nvim-tree").opts,
  },
  -- {
  --     "nvim-treesitter/nvim-treesitter-textobjects",
  --     opts = require("custom.configs.treesitter-textobjects").opts,
  --     config = function ()
  --         require("nvim-treesitter.configs")
  --     end
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    opts = require("custom.configs.telescope").opts,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    -- lazy=false,
  },
  {
    "mbbill/undotree",
    event = "BufRead",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require "custom.configs.nvim-dap-ui"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  -- {
  --     "jose-elias-alvarez/null-ls.nvim",
  --     ft = { "python", "javascript", "htmldjango", "html", "css", "cs", "go" },
  --     opts = function ()
  --         return require "custom.configs.null-ls"
  --     end
  -- },
  {
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
    ft = code_files,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "custom.configs.nvim-lint"
    end,
  }, -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
    ft = code_files,
  },
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {},
  },
  {
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
  },
  {
    "tpope/vim-fugitive",
    event = "BufRead",
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
  },
  {
    "theprimeagen/harpoon",
    event = "VeryLazy",
  },
}

return plugins
