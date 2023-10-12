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
        -- [";"] = { ":", "enter cmdline", opts = { nowait = true } },
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
        ["<leader>fn"] = { "<cmd> Telescope lsp_document_symbols ignore_symbols=variable <CR>", "Find in current buffer" },
        ["<leader>ft"] = { "<cmd> Telescope help_tags <CR>", "Find in current buffer" },

        ["<leader>gs"] = { "<cmd> LazyGit<CR>", "Git status!" },


        ["gr"] = {"<cmd> Telescope lsp_references<CR>", "lsp references"},
        ["gd"] = {"<cmd> Telescope lsp_definitions<CR>", "lsp definitions"},

        -- fancy tmux integration
        ["<C-f>"] = {"<cmd>silent !tmux neww tmux-sessionizer<cr>"},

        ["<leader>riv"] = { ":Refactor inline_var", "Refactor inline variable"},
        ["<leader>rif"] = { ":Refactor inline_func", "Refactor inline function"},
        ["<leader>rb"] = { ":Refactor extract_block", "Refactor extract block"},
        ["<leader>rbf"] = { ":Refactor extract_block_to_file", "Refactor extract block to file"},
        ["<leader>db"] = {"<cmd> DBUIToggle<CR>", "Toggle dadbod databse ui"},
        ["<leader>fi"] = {"ggVG=", "Reindent file"},

        ["<leader>fml"] = {function ()
            require("cellular-automaton").start_animation("make_it_rain")
        end},

        ["<leader>fu"] = {function ()
            require("cellular-automaton").start_animation("scramble")
        end},
        ["<leader>ffs"] = {function ()
            require("cellular-automaton").start_animation("game_of_life")
        end},



    },
    v = {
        ["J"] = {":m '>+1<CR>gv=gv", "Move selected lines down"},
        ["K"] = {":m '<-2<CR>gv=gv", "Move selected lines down"},
        ["<leader>y"] = {"\"+y", "Yank to system clipboard"},
        ["<leader>d"] = {"\"_d", "Delete line to system clipboard"},
    },
    x = {
        ["<leader>p"] = {"\"_dP", "Paste over highlighted text and preserve clipboard"},
        ["<leader>re"] = { ":Refactor extract ", "Refactor extract method"},
        ["<leader>rf"] = { ":Refactor extract_to_file ", "Refactor extract to other file"},
        ["<leader>rv"] = { ":Refactor extract_var ", "Refactor extract variable"},
        ["<leader>ri"] = { ":Refactor inline_var", "Refactor inline variable"},

    },
    i = {
        ["<C-c>"] = {"<Esc>", "Remap for vertical edit to handle C-c"},
        ["<C-a>"] = { "<ESC>^i", "Beginning of line" },
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
            end, "\"Debug python run\""
        }
    }
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
				require("trouble").open("document_diagnostics")
			end,
			"toggle trouble with workspace diagnostics",
			opts = { silent = true, noremap = true },
		},
	},
}
M.copilot = {
    i = {
    ["<M-CR>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  }
}
return M
