return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>;", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<leader><C-j>", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<leader><C-k>", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<leader><C-l>", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<leader><C-;>", function()
			harpoon:list():replace_at(4)
		end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
