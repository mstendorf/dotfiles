-- sign column to show I've gone to far
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- always have relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.scrolloff = 8 -- always keep at least 8 lines at the bottom

vim.opt.hlsearch = false -- remove highligted words after searching
vim.opt.incsearch = true

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

vim.opt.pumblend = 0

vim.g.loaded_python3_provider = 0
-- vim.g.python_host_prog = "/usr/bin/python2"
-- vim.g.python3_host_prog = "/usr/bin/python3"
