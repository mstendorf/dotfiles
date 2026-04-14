return {
	"stevearc/conform.nvim",
	config = function()
		local options = {
			formatters = {
				stylua = {
					extra_args = {
						"--config-path ~/.config/stylua.toml",
					},
				},
				ruff_organize_imports = {
					command = "ruff",
					args = {
						"check",
						"--force-exclude",
						"--fix",
						"--exit-zero",
						"--stdin-filename",
						"$FILENAME",
						"-",
					},
					stdin = true,
					cwd = require("conform.util").root_file({
						"pyrightconfig.json",
						"pyproject.toml",
						"ruff.toml",
						".ruff.toml",
					}),
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- cs = { "csharpier" },
				javascript = { "prettierd" },
				go = { "gofmt", "goimports" },
				tpl = { "djlint" },
				python = { "ruff_format", "ruff_organize_imports" },
				html = { "djlint" },
				htmldjango = { "djlint" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascriptreact = { "prettierd" },
				yaml = { "prettierd" },
				rust = { "rustfmt" },
			},
		}
		require("conform").setup(options)
	end,
}
