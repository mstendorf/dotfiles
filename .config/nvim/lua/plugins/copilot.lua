return {
	{
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
			vim.keymap.set("i", "<M-CR>", function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end, {
				desc = "Copilot Accept",
				replace_keycodes = true,
				nowait = true,
				silent = true,
				expr = true,
				noremap = true,
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			require("copilot").setup({
				--     suggestion = {
				--         enabled = true,
				--         auto_trigger = true,
				--         keymap = {
				--             accept = "<C-a>",
				--         },
				--     },
				--     panel = {
				--         enabled = false,
				--     },
				--     filetypes = {
				--         yaml = true,
				--         markdown = true,
				--     },
				-- })
				--
				-- require("copilot_cmp").setup()
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		-- dependencies = { "zbirenbaum/copilot.lua" },
		branch = "main",
		cmd = "CopilotChat",
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				auto_insert_mode = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.4,
				},
			}
		end,
		keys = {
			{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
			{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
			{
				"<leader>aa",
				function()
					return require("CopilotChat").toggle()
				end,
				desc = "Toggle (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>ax",
				function()
					return require("CopilotChat").reset()
				end,
				desc = "Clear (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end,
				desc = "Quick Chat (CopilotChat)",
				mode = { "n", "v" },
			},
			-- Show prompts actions with telescope
			-- { "<leader>ap", M.pick("prompt"), desc = "Prompt Actions (CopilotChat)", mode = { "n", "v" } },
		},
		config = function(_, opts)
			local chat = require("CopilotChat")

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			chat.setup(opts)
		end,
	},
}
