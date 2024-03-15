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

-- more standardized tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

vim.opt.swapfile = false -- no swap files
-- vim.diagnostic.config({
--   virtual_text = {
--     source = true
--   }
-- })

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
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev w1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qa! qa!
cnoreabbrev Qall! qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev wq1 wq!
cnoreabbrev Wq1 wq!
cnoreabbrev wQ1 wq!
cnoreabbrev WQ1 wq!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
]])

vim.api.nvim_create_autocmd({ "LspAttach", "TextChanged", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

-- vim.api.nvim_create_autocmd({ "LspAttach" }, {
--   desc = "Disable semantic tokens for rustaceanvim as it fucks the colorscheme",
--   group = vim.api.nvim_create_augroup("disable-rustacean-colors", { clear = true }),
--   callback = function(opts)
--     if vim.bo[opts.buf].filetype == "rust" then
--       local client = vim.lsp.get_client_by_id(opts.data.client_id)
--       client.server_capabilities.semanticTokensProvider = nil
--     end
--   end,
-- })

vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#444b6a", italic = true })
require("ibl").update()
