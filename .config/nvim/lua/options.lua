require("nvchad.options")
-- sign column to show I've gone to far
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- always have relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.scrolloff = 8 -- always keep at least 8 lines at the bottom

vim.opt.hlsearch = false -- remove highligted words after searching
vim.opt.incsearch = true -- search as you type

-- more standardized tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false -- no swap files
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
-- vim.opt.cmdheight = 1

local opts = { noremap = true, silent = true }

local function quickfix()
	vim.lsp.buf.code_action({
		filter = function(a)
			return a.isPreferred
		end,
		apply = true,
	})
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- vim.api.nvim_create_autocmd({ "LspAttach" }, {
--     desc = "Disable semantic tokens for rustaceanvim as it fucks the colorscheme",
--     group = vim.api.nvim_create_augroup("disable-rustacean-colors", { clear = true }),
--     callback = function(opts)
--         if vim.bo[opts.buf].filetype == "rust" then
--             local client = vim.lsp.get_client_by_id(opts.data.client_id)
--             client.server_capabilities.semanticTokensProvider = nil
--         end
--     end,
-- })

vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#444b6a", italic = true })

-- close deleted files via oil.nvim
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(args)
		local parse_url = function(url)
			return url:match("^.*://(.*)$")
		end

		if args.data.err then
			return
		end

		for _, action in ipairs(args.data.actions) do
			if action.type == "delete" and action.entry_type == "file" then
				local path = parse_url(action.url)
				local bufnr = vim.fn.bufnr(path)
				if bufnr == -1 then
					return
				end

				local winnr = vim.fn.win_findbuf(bufnr)[1]
				if not winnr then
					return
				end

				vim.fn.win_execute(winnr, "bfirst | bw " .. bufnr)
			end
		end
	end,
})
-- vim.diagnostic.config({
--     float = { border = "rounded" },
-- })

-- force prettier diagnostics for all languages
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end
