local M = {}

M.base46 = {
    transparency = true,
    theme = "gruvchad",
}
M.lsp = {
    signature = false,
}
M.ui = {
    cmp = {
        style = "atom_colored",
        lspkind_text = true,
        -- icons_left = true,
    },
    tabufline = {
        enabled = false,
    },
    -- nvimtree = {
    --     enabled = false,
    -- },
    statusline = {
        theme = "minimal",
        separator_style = "round",
        order = { "mode", "fileInfo", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
        modules = {
            fileInfo = function()
                local sep_style = "round"
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
                local fn = vim.fn
                local icon = "󰈚"
                local filename = (fn.expand("%") == "" and "Empty") or fn.expand("%:~:.")

                if filename ~= "Empty" then
                    local devicons_present, devicons = pcall(require, "nvim-web-devicons")

                    if devicons_present then
                        local ft_icon = devicons.get_icon(filename)
                        icon = (ft_icon ~= nil and ft_icon) or icon
                    end
                end

                return gen_block(icon, filename, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#") .. " "
            end,
        },
    },
}

return M
