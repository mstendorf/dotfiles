return {
	-- "ray-x/go.nvim",
	-- dependencies = { -- optional packages
	-- 	"ray-x/guihua.lua",
	-- 	"neovim/nvim-lspconfig",
	-- 	"nvim-treesitter/nvim-treesitter",
	-- },
	-- config = function()
	-- 	-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- 	local config = require("nvchad.configs.lspconfig")
	--
	-- 	require("go").setup({
	-- 		lsp_cfg = {
	-- 			capabilities = config.capabilities,
	-- 			on_attach = config.on_attach,
	-- 		},
	-- 		lsp_gofumpt = true,
	-- 		lsp_keymaps = false,
	-- 		lsp_codelens = false,
	-- 		trouble = true,
	-- 		luasnip = true,
	-- 		lsp_inlay_hints = {
	-- 			enable = false,
	-- 		},
	-- 	})
	-- end,
	-- event = { "CmdlineEnter" },
	-- ft = { "go", "gomod" },
	-- build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}