return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  ---@diagnostic enable: missing-fields
  config = function ()
    require("fzf-lua").setup{
      winopts = {
        split = "belowright new",
        preview = {
          horizontal = "right:50%",
          vertical = "down:60%",
          -- layout = "vertical",
          border = "border-rounded",
        }
      },
      git = {
        diff = {
          actions = {
            true,  -- inherit defaults
            ["ctrl-q"] = false,  -- disabled to use "open quickfix" keymap
          }
        }
      },
      actions = {
        files = {
          true,  -- inherit defaults
          ["ctrl-q"] = { fn = require("fzf-lua.actions").file_sel_to_qf, prefix = "select-all+" },
        },
      },
    }
  end,
  keys = {
    { "<leader>f", function() require("fzf-lua").files() end, desc = "Find Files" },
    { "<leader>g", function() require("fzf-lua").live_grep() end, desc = "Grep" },
    { "<leader>/", function() require("fzf-lua").blines() end, desc = "Buffer Lines" },
    { "<leader>:", function() require("fzf-lua").command_history() end, desc = "Command History" },
    { "<leader>h", function() require("fzf-lua").helptags() end, desc = "Help Pages" },
    { "<leader>p", function() require("fzf-lua").builtin() end, desc = "Pickers" },
    { "<leader>q", function() require("fzf-lua").quickfix() end, desc = "Quickfix List" },
    { "<c-q>", function()
      if vim.bo.buftype == "quickfix" then
        vim.cmd("cclose")
        require("fzf-lua").quickfix()
      else
        vim.cmd("copen")
      end
    end, desc = "Toggle Quickfix / Picker" },
    { "<leader>r", function() require("fzf-lua").oldfiles() end, desc = "Recent Files" },
    { "<leader>sm", function() require("fzf-lua").marks() end, desc = "Marks" },
    { "<leader>sq", function() require("fzf-lua").quickfix() end, desc = "Quickfix List" },
    { "<leader>s/", function() require("fzf-lua").search_history() end, desc = "Search History" },
  },
}

