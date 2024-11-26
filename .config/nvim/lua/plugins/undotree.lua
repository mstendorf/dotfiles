return {
	"mbbill/undotree",
	event = "BufRead",
	config = function()
		vim.keymap.set("n", "<leader>u", "<cmd> UndotreeToggle<CR>", { desc = "Undotreee toggle" })
	end,
}
