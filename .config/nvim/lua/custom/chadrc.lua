---@type ChadrcConfig 
local M = {}
M.ui = {
    theme = 'catppuccin',
    cmp = {
        style = "atom"
    },
    statusline = {
        theme = "minimal",
        separator_style = "block",
        overriden_modules = function(modules)
            modules[#modules] = require("custom.configs.statusline").cursor_position()
            -- modules[#modules + 1] = require("custom.configs.statusline").clock()
            -- modules[#modules] = require("custom.configs.statusline").fileInfo()
            table.remove(modules, 2)
            table.insert(modules, 2, require("custom.configs.statusline").fileInfo())

            -- table.insert(modules, 8, require("custom.configs.statusline").showcmd())
        end,
    }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
