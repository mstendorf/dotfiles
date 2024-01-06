local M = {}

-- test comment
M.disabled = {
  -- disable some default NVchad keybind we remapped, does not matter much but makes for a better cheat sheet
  n = {
    ["<leader>gt"] = "", -- rebound to <leader>gs
    ["<leader>cm"] = "", -- rebound to <leader>gc
    ["<leader>ls"] = "",
    ["<leader>lf"] = "",
  },
}

M.general = {
  n = {
    -- [";"] = { ":", "enter cmdline", opts = { nowait = true } },
    ["J"] = { "mzJ`z", "Join line with cursor in place" },
    ["<leader>y"] = { '"+y', "Yank to system clipboard" },
    ["<leader>Y"] = { '"+Y', "Yank line to system clipboard" },
    ["<leader>d"] = { '"_d', "Delete line to system clipboard" },
    ["Q"] = { "<nop>" },
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>", "Replace word under cursor" },
    ["<leader>ex"] = { "<cmd>!chmod +x %<CR>", "Make current file executeable" },
    ["<C-d>"] = { "<C-d>zz", "Keep cursor centered while scrolling" },
    ["<C-u>"] = { "<C-u>zz", "Keep cursor centered while scrolling" },

    -- tmux navigation settings overwriting what nvchad overwrote from vim, going full circle here
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    -- telescope bindings
    ["<leader>t"] = { "<cmd> Telescope builtin <CR>", "List telescope functions as fuzzy search" },
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true <CR>", "Find files" },
    ["<leader>fc"] = { "<cmd> Telescope commands <CR>", "Find in current buffer" },
    ["<leader>fn"] = { "<cmd> Telescope lsp_document_symbols ignore_symbols=variable <CR>", "Find in current buffer" },
    ["<leader>ft"] = { "<cmd> Telescope help_tags <CR>", "List help tags of nvim" },
    -- ["<leader>u"] = { "<cmd> Telescope undo <CR>", "Undotreee toggle" },
    ["<leader>u"] = { "<cmd> UndotreeeToggle<CR>", "Undotreee toggle" },
    ["<leader>gf"] = { "<cmd> Telescope git_files <CR>", "Find files tracked by git" },

    ["<leader>gs"] = { "<cmd> LazyGit<CR>", "Git status!" },
    ["<leader>gh"] = { "<cmd> 0Gclog<CR>", "Git file history!" },
    ["<leader>gvh"] = { "<cmd> 0Gclog<CR>", "Git file history!" },

    ["gr"] = { "<cmd> Telescope lsp_references<CR>", "lsp references" },
    ["gd"] = { "<cmd> Telescope lsp_definitions<CR>", "lsp definitions" },

    -- fancy tmux integration
    ["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<cr>" },

    ["<leader>riv"] = { ":Refactor inline_var", "Refactor inline variable" },
    ["<leader>rif"] = { ":Refactor inline_func", "Refactor inline function" },
    ["<leader>rb"] = { ":Refactor extract_block", "Refactor extract block" },
    ["<leader>rbf"] = { ":Refactor extract_block_to_file", "Refactor extract block to file" },
    ["<leader>db"] = { "<cmd> DBUIToggle<CR>", "Toggle dadbod databse ui" },
    ["<leader>fi"] = { "ggVG=", "Reindent file" },

    ["<leader>fml"] = {
      function()
        require("cellular-automaton").start_animation "make_it_rain"
      end,
    },

    ["<leader>fu"] = {
      function()
        require("cellular-automaton").start_animation "scramble"
      end,
    },
    ["<leader>fuu"] = {
      function()
        require("cellular-automaton").start_animation "game_of_life"
      end,
    },
    -- centered search
    ["n"] = { "nzz", "Centered jumps in search mode" },
    ["N"] = { "Nzz", "Centered jumps in search mode" },
    ["*"] = { "*zz", "Center search term on init" },
    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["K"] = {
      function()
        require("pretty_hover").hover()
      end,
      "LSP hover",
    },
    ["-"] = { "<CMD>Oil<CR>", "Open parent directory" },

    -- harpoon
    ["<leader>m"] = {
      function()
        require("harpoon"):list():append()
      end,
      "Add file to harpoon",
    },
    ["<leader>h"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "Toggle harpoon menu",
    },
    ["<leader>j"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Go to harpoon mark 1",
    },
    ["<leader>k"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Go to harpoon mark 2",
    },
    ["<leader>l"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Go to harpoon mark 3",
    },
    ["<leader>;"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Go to harpoon mark 4",
    },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected lines down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected lines down" },
    ["<leader>y"] = { '"+y', "Yank to system clipboard" },
    ["<leader>d"] = { '"_d', "Delete line to system clipboard" },
    ["<leader>gh"] = { ":Gclog<CR>", "Git file history!" },
  },
  x = {
    ["<leader>p"] = { '"_dP', "Paste over highlighted text and preserve clipboard" },
    ["<leader>re"] = { ":Refactor extract ", "Refactor extract method" },
    ["<leader>rf"] = { ":Refactor extract_to_file ", "Refactor extract to other file" },
    ["<leader>rv"] = { ":Refactor extract_var ", "Refactor extract variable" },
    ["<leader>ri"] = { ":Refactor inline_var", "Refactor inline variable" },
  },
  i = {
    ["<C-c>"] = { "<Esc>", "Remap for vertical edit to handle C-c" },
    ["<C-a>"] = { "<ESC>^i", "Beginning of line" },
  },
}
-- bindings for python debugging
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" }, -- set breakpoint
  },
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = { -- "debug python run"
      function()
        require("dap-python").test_method()
      end,
      '"Debug python run"',
    },
  },
}

-- M.actions_preview = {
--     n = {
--        ["<leader>ca"] = {
--             function ()
--             require("actions-preview").code_actions()
--        end , "Code actions" },
--     }
-- }

-- M.telescope = {
--     i = {
--         ["<S-Down>"] = {
--                 require("telescope.actions").cycle_history_next
--         },
--         ["<S-Up>"] = {
--                 require("telescope.actions").cycle_history_prev
--         },
--     }
-- }

M.trouble = {
  n = {
    ["<leader>ww"] = {
      function()
        require("trouble").toggle "document_diagnostics"
      end,
      "toggle trouble with workspace diagnostics",
      opts = { silent = true, noremap = true },
    },
  },
}
M.lsp = {
  n = {
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "format with conform",
    },
  },
}
M.copilot = {
  i = {
    ["<M-CR>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}
return M
