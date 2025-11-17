return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		-- Suppress lspconfig deprecation warning
		vim.g.lspconfig_deprecation_notice_shown = true

		-- Use NvChad's default lspconfig setup
		require("nvchad.configs.lspconfig").defaults()

		local config = require("nvchad.configs.lspconfig")
		local capabilities = config.capabilities
		local on_init = config.on_init

		-- Ensure blink.cmp capabilities are included
		local blink_ok, blink = pcall(require, "blink.cmp")
		if blink_ok then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		-- Custom on_attach function
		local on_attach = function(client, bufnr)
			config.on_attach(client, bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = desc }
			end
			vim.keymap.set("n", "<leader>ca", function()
				require("actions-preview").code_actions()
			end, opts("Code actions"))

			vim.keymap.set("n", "gr", function()
				require("telescope.builtin").lsp_references()
			end, opts("References"))
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts("LSP definitions"))
		end

		-- Use the new vim.lsp.config API for each server
		local servers = {
			yamlls = {},
			bashls = { filetypes = { "bash", "sh", "zsh" } },
			basedpyright = {
				filetypes = { "python" },
				settings = {
					python = {
						analysis = {
							reportArgumentType = "none",
							diagnosticMode = "workspace",
							typeCheckingMode = "off",
						},
					},
				},
			},
			jinja_lsp = { filetypes = { "jinja", "html", "htmldjango" } },
			eslint = { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" } },
			tailwindcss = {
				filetypes = {
					"html",
					"html.jinja",
					"css",
					"scss",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
			},
			ts_ls = { filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },
			html = {
				filetypes = { "html", "html.jinja", "css" },
				settings = {
					html = {
						format = { indentInnerHtml = true },
					},
				},
			},
			gopls = { filetypes = { "go", "gomod", "gosum", "gohtmltmpl", "gotexttmpl" } },
			rust_analyzer = {
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						assist = { importEnforceGranularity = true },
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy", allFeatures = true },
						inlayHints = {
							lifetimeElisionHints = { enable = true, useParameterNames = true },
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			},
			clangd = { filetypes = { "c", "cpp", "objc", "objcpp" } },
			emmet_ls = { filetypes = { "html", "htmldjango", "html.jinja", "css" } },
		}

		-- Setup each server with the new API
		for server, server_config in pairs(servers) do
			local final_config = vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				on_init = on_init,
				capabilities = capabilities,
			}, server_config)

			vim.lsp.config(server, final_config)
			vim.lsp.enable(server)
		end
	end,
}
