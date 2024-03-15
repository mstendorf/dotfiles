local fn = vim.fn
local config = require("core.utils").load_config().ui.statusline
local sep_style = config.separator_style

sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block" or sep_style

local default_sep_icons = {
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
}

local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = "%#St_sep_r#" .. separators["right"]
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
  return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

local M = { minimal = {} }

-- M.minimal.showcmd = function()
--   local text = ""
--
--   if require("noice").api.status.command.has() and require("noice").api.status.command.get() then
--     text = "%#St_show_cmd#" .. require("noice").api.status.command.get()
--   end
--   if require("noice").api.status.mode.has() and require("noice").api.status.mode.get() then
--     text = text .. " " .. "%#St_show_mode#" .. require("noice").api.status.mode.get()
--   end
--
--   return text .. " "
-- end

M.minimal.fileInfo = function()
    local icon = "󰈚"
    local filename = (fn.expand "%" == "" and "Empty") or fn.pathshorten(fn.expand "%", 3)

    if filename ~= "Empty" then
        local devicons_present, devicons = pcall(require, "nvim-web-devicons")

        if devicons_present then
            local ft_icon = devicons.get_icon(filename)
            icon = (ft_icon ~= nil and ft_icon) or icon
        end
    end

    return gen_block(icon, filename, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#") .. " "
end

M.minimal.cursor_position = function()
  return gen_block("", "%l:%c", "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#") .. " %#ST_EmptySpace#"
end

M.minimal.clock = function()
  return gen_block("", os.date "%H:%M", "%#St_Clock_sep#", "%#St_Clock_bg#", "%#St_Clock_txt#")
end

return M[config.theme]
