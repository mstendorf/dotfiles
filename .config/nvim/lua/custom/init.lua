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
  vim.lsp.buf.code_action {
    filter = function(a)
      return a.isPreferred
    end,
    apply = true,
  }
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)
vim.cmd [[
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
]]

vim.api.nvim_create_autocmd({ "LspAttach", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
