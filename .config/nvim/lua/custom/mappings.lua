local M = {}

M.general = {
  n = {
    ["J"] = {"mzJ`z", "Join line with cursor in place"},
    ["<leader>y"] = {"\"+y", "Yank to system clipboard"},
    ["<leader>Y"] = {"\"+Y", "Yank line to system clipboard"},
    ["<leader>d"] = {"\"_d", "Delete line to system clipboard"},
    ["Q"] = {"<nop>"},
    ["<leader>s"] = {":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", "Replace word under cursor"},
    ["<leader>ex"] = {"<cmd>!chmod +x %<CR>", "Make current file executeable"},
    ["<leader>u"] = {vim.cmd.UndotreeToggle, "Undotreee toggle"},
    ["<C-d>"] = {"<C-d>zz", "Keep cursor centered while scrolling"},
    ["<C-u>"] = {"<C-u>zz", "Keep cursor centered while scrolling"},
    ["<leader>gf"] = {"<cmd> Telescope git_files <CR>", "Find files tracked by git"},

    -- tmux navigation settings overwriting what nvchad overwrote from vim, going full circle here
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "window up"},


  },
  v = {
    ["J"] = {":m '>+1<CR>gv=gv", "Move selected lines down"},
    ["K"] = {":m '<-2<CR>gv=gv", "Move selected lines down"},
    ["<leader>y"] = {"\"+y", "Yank to system clipboard"},
    ["<leader>d"] = {"\"_d", "Delete line to system clipboard"},
  },
  x = {
    ["<leader>p"] = {"\"_dP", "Paste over highlighted text and preserve clipboard"},
  },
  i = {
    ["<C-c>"] = {"<Esc>", "Remap for vertical edit to handle C-c"},
  }
}
-- bindings for python debugging
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"} -- set breakpoint
  }
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = { -- "debug python run"
      function ()
        require("dap-python").test_method()
      end
    }
  }
}
return M
