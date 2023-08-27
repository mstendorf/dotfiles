local M = {}

-- test comment
M.disabled = {
  -- disable some default NVchad keybind we remapped, does not matter much but makes for a better cheat sheet
  n = {
    ["<leader>gt"] = "", -- rebound to <leader>gs
    ["<leader>cm"] = "", -- rebound to <leader>gc
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter cmdline", opts = { nowait = true } },
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
    -- overwrite default nvchad find_files so it follows symlinks
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true <CR>", "Find files" },
    ["<leader>fc"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    --["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    --["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>gs"] = { "<cmd> LazyGit<CR>", "Git status!" },


    ["gr"] = {"<cmd> Telescope lsp_references<CR>", "lsp references"},
    ["gd"] = {"<cmd> Telescope lsp_definitions<CR>", "lsp definitions"},
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
