return {
	"github/copilot.vim",
	-- lazy = false,
	event = "LspAttach",

	cmd = "Copilot",
	config = function()
		-- Mapping tab is already used by NvChad
		vim.g.copilot_no_tab_map = true
		vim.g.copilot_assume_mapped = true
		vim.g.copilot_tab_fallback = ""
		-- The mapping is set to other key, see custom/lua/mappings
		-- or run <leader>ch to see copilot mapping section
		vim.cmd([[Copilot]])
		vim.keymap.set(
			"i",
			"<M-CR>",
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			{
				desc = "Copilot Accept",
				replace_keycodes = true,
				nowait = true,
				silent = true,
				expr = true,
				noremap = true,
			}
		)
	end,
}
