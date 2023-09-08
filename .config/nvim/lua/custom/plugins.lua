local plugins = {
    -- {
    --     "Dhanus3133/LeetBuddy.nvim",
    --
    -- },
    {
        "aznhe21/actions-preview.nvim",
        config = function () end,
        --event = "VeryLazy"
        lazy=false
    },
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("trouble").setup({})
        end
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("refactoring").setup()
        end,
        ft = {"python", "lua", "javascript", "php", "golang", "c", "c++"},
        lazy=false
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("custom.configs.gitsigns")
        end,
        lazy=false
    },
    {
        "ggandor/leap.nvim",
        config = function () require("leap").set_default_keymaps() end,
        lazy=false
    },
    {
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        lazy=false,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = require("custom.configs.nvim-tree").opts
    },
    {
        -- overwrite ensure_installed to customize for our languages.
        "nvim-treesitter/nvim-treesitter",
        opts = require('custom.configs.treesitter').opts
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = require('custom.configs.telescope').opts
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy=false,
    },
    {
        "mbbill/undotree",
        lazy = false
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function ()
            require("custom.configs.nvim-dap-ui")
        end
    },
    {
        "mfussenegger/nvim-dap",
        config = function (_, _)
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function (_, _)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "python", "javascript", "html", "css", "cs" },
        opts = function ()
            return require "custom.configs.null-ls"
        end
    },
    {
        "williamboman/mason.nvim",
        opts = require('custom.configs.mason').opts
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    }
}

return plugins
