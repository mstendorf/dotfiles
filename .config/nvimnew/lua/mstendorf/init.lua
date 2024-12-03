require("mstendorf.set")
require("mstendorf.mappings")
require("mstendorf.lazy_init")

-- vim.api.nvim_create_autocmd({ "LspAttach", "TextChanged", "InsertLeave" }, {
-- 	callback = function()
-- 		require("lint").try_lint()
-- 	end,
-- })

-- vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#444b6a", italic = true })
--
-- vim.diagnostic.config({
-- 	float = { border = "rounded" },
-- })
