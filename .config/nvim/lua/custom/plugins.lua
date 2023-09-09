local plugins = {
    
    {
        "ray-x/go.nvim",
        dependencies = {  -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            require("go").setup({
                lsp_cfg = {
                    capabilities=capabilities
                },
                lsp_gofumpt = true,
                lsp_keymaps = false,
                trouble = true,
                luasnip = true
            })
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    -- {
    --     "tpope/vim-dadbod",
    --     lazy=false,
    --     dependencies = {
    --         "kristijanhusak/vim-dadbod-ui",
    --         "kristijanhusak/vim-dadbod-completion",
    --     },
    --     config = function ()
    --         require("custom.configs.dadbod").setup()
    --     end
    -- },
    {
        "abecodes/tabout.nvim",
        event = "InsertEnter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function ()
            require("tabout").setup({})
        end
    },
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
        opts = require("custom.configs.gitsigns").opts
        -- config = function ()
        --     require("custom.configs.gitsigns")
        -- end,
        -- lazy=false
    },
    {
        "ggandor/leap.nvim",
        config = function () require("leap").set_default_keymaps() end,
        lazy=false
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        lazy=false,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = require("custom.configs.nvim-tree").opts
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = require('custom.configs.treesitter').opts,
        dependencies = {
            "windwp/nvim-ts-autotag",
            "nvim-treesitter/nvim-treesitter-context"
        }
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
        dependencies = {
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text"},
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
        ft = { "python", "javascript", "html", "css", "cs", "go" },
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
