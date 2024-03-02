---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["J"] = { "mzJ`z", "join current line with the one below" },
    ["<leader>?"] = { ":Telescope keymaps<CR>", "show all keymaps" },
    ["<leader>fl"] = { ":Telescope current_buffer_fuzzy_find<CR>", "fuzzy find in current buffer" },
    ["<leader>ps"] = {
      function()
        require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " }
      end,
      "grep string",
    },
    ["<leader>k"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "show function signature",
    },
    ["<leader>xx"] = { ":TroubleToggle<CR>", "toggle errors" },
    ["<leader>;"] = {
      function()
        -- If we find a floating window, close it.
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_config(win).relative ~= "" then
            vim.api.nvim_win_close(win, true)
          end
        end
      end,
      "close all floating windows",
    },
    ["<leader>zz"] = {
      function()
        require("zen-mode").setup {
          window = {
            width = 90,
            options = {},
          },
        }
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
      end,
      "toggle zen mode",
    },
    ["<leader>g"] = {
      function()
        local terminal = require("toggleterm.terminal").Terminal
        local lazygit = terminal:new { cmd = "lazygit && exit", hidden = true, direction = "float" }
        lazygit:toggle()
      end,
      "toggle lazygit tui",
    },
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
    ["m"] = { ":HopWord<CR>", "hop to any word in the current buffer" },
    ["<leader>ie"] = { ":GoIfErr<CR>", "insert go error handling block"}
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["J"] = { ":m '>+1<CR>gv=gv", "move selected block down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move selected block up" },
  },
}

return M
