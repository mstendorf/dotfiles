vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("lazy_config")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
        config = function()
            require("options")
        end,
    },

    { import = "plugins" },
    -- { import = "nvchad.blink.lazyspec" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

-- vim.filetype.add("htmldjango", "html.jinja")
vim.filetype.add({
    extension = { html = "html.jinja", htmldjango = "html.jinja" },
})

vim.schedule(function()
    require("mappings")
end)

function new_git_worktree()
    local worktree = vim.fn.input("Enter worktree name: ")
    require("git-worktree").create_worktree(worktree, worktree, "origin")
end
