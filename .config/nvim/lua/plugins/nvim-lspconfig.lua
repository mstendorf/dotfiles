return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		-- require "plugins.configs.lspconfig"
		require("nvchad.configs.lspconfig").defaults()
		-- require("configs.lspconfig")
		local config = require("nvchad.configs.lspconfig")

		-- local config = require "plugins.configs.lspconfig"
		local on_attach = function(client, bufnr)
			local function opts(desc)
				return { buffer = bufnr, desc = desc }
			end
			config.on_attach(client, bufnr)
			vim.keymap.set("n", "<leader>ca", function()
				require("actions-preview").code_actions()
			end, opts("Code actions"))

			vim.keymap.set("n", "gr", function()
				require("telescope.builtin").lsp_references()
			end, opts("References"))
			vim.keymap.set("n", "gd", "<cmd> Telescope lsp_definitions<CR>", { desc = "lsp definitions" })
		end
		-- local on_attach = config.on_attach
		local on_init = config.on_init
		-- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		local capabilities = config.capabilities

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		lspconfig.omnisharp.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			--cmd = {"dotnet", os.getenv("HOME") .. "/Users/martinstendorf/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"},
			cmd = { "dotnet", os.getenv("HOME") .. "/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			enable_editorconfig_support = true,
			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			enable_ms_build_load_projects_on_demand = false,
			-- Enables support for roslyn analyzers, code fixes and rulesets.
			enable_roslyn_analyzers = false,
			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			organize_imports_on_format = true,
			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			enable_import_completion = true,
			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			sdk_include_prereleases = true,
			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			analyze_open_documents_only = false,
		})
		-- yaml
		lspconfig.yamlls.setup({
			autostart = false,
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		})

		-- bash
		lspconfig.bashls.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "bash", "sh", "zsh" },
		})

		lspconfig.basedpyright.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "python" },
		})

		-- lspconfig.pyright.setup({
		--     on_attach = on_attach,
		--     on_init = on_init,
		--     capabilities = capabilities,
		--     -- capabilities = (function()
		--     --     local capa = vim.lsp.protocol.make_client_capabilities()
		--     --     capa.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
		--     --     return capa
		--     -- end)(),
		--     -- before_init = function(_, conf)
		--     --     -- local default_venv_path = path.join(vim.env.HOME, ".pyenv", "versions", "bnaaenv", "bin", "python")
		--     --     local default_venv_path = os.getenv("HOME") .. "/.pyenv/versions/bnaaenv"
		--     --
		--     --     conf.settings.python.pythonPath = default_venv_path .. "/bin/python"
		--     --
		--     --     conf.settings.python.analysis.useLibraryCodeForTypes = true
		--     -- end,
		--     root_dir = function(fname)
		--         local root_files = {
		--             "pyrightconfig.json",
		--             -- "pyproject.toml",
		--             -- 'Dockerfile',
		--         }
		--         local path = util.root_pattern(unpack(root_files))(fname)
		--             or util.find_git_ancestor(fname)
		--             or util.path.dirname(fname)
		--
		--         return path
		--     end,
		--     settings = {
		--         python = {
		--             disableOrganizeImports = false,
		--             analysis = {
		--                 autoSearchPaths = true,
		--                 useLibraryCodeForTypes = true,
		--                 diagnosticMode = "workspace",
		--                 autoImportCompletions = true,
		--                 -- typeCheckingMode = "basic",
		--             },
		--             -- handlers = {
		--             --   ["textDocument/publishDiagnostics"] = function() end,
		--             -- },
		--         },
		--     },
		--     filetypes = { "python" },
		-- })
		--
		lspconfig.jinja_lsp.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "jinja", "html", "htmldjango" },
		})
		-- lspconfig.ruff_lsp.setup :
		--   on_attach = on_attach,
		--   init_options = {
		--     settings = {
		--       -- Any extra CLI arguments for `ruff` go here.
		--       args = {
		--                 "--line-length=110",
		--             },
		--     }
		--   }
		-- }
		lspconfig.ts_ls.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "javascript" },
		})

		lspconfig.html.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			-- capabilities = function()
			-- 	local capa = vim.lsp.protocol.make_client_capabilities()
			-- 	capa.textDocument.completion.completionItem.snippetSupport = true
			-- 	return capa
			-- end,
			configurationSection = { "html", "css" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			--provideFormatter = true,
			filetypes = { "html", "css" },
		})

		lspconfig.gopls.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "go", "gomod", "gosum", "gohtmltmpl", "gotexttmpl" },
		})

		lspconfig.rust_analyzer.setup({
			-- on_attach = function(client, bufnr)
			-- 	-- require("lsp_signature").on_attach()
			-- 	-- require("lsp-inlayhints").on_attach(client, bufnr)
			-- 	on_attach(client, bufnr)
			-- end,
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "rust" },
			settings = {
				-- rust-analyzer language server configuration
				["rust-analyzer"] = {
					assist = {
						importEnforceGranularity = true,
						-- importPrefix = "create"
					},
					cargo = { allFeatures = true },
					checkOnSave = {
						-- default: `cargo check`
						command = "clippy",
						allFeatures = true,
					},
					inlayHints = {
						lifetimeElisionHints = {
							enable = true,
							useParameterNames = true,
						},
					},
				},
			},
		})

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "Lua 5.1" },
					diagnostics = {
						globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
					},
					-- workspace = {
					-- 	library = {
					-- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					-- 		[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					-- 	},
					-- },
					-- telemetry = {
					-- 	enable = false,
					-- },
				},
			},
		})

		lspconfig.clangd.setup({
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp" },
		})
	end,
}
