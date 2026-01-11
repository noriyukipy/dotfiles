return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- Install Cica font to show icons on terminal.
  -- Use nvim-web-devicons because mini.icons does not show some file font icons with Cica font.
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = false, -- Replace netrw with the snacks explorer
      trash = true, -- Use the system trash when deleting files
    },
    indent = {
      enabled = true,
      animate = {
        enabled = false,
      }
    },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ["<c-e>"] = { "qflist", mode = { "i", "n" } },
          },
        },
      },
    },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 10, total = 100 },
      },
    },
    statuscolumn = { enabled = true },
    terminal = {
      enabled = true,
      shell = "bash",
    }
  },
  keys = {
    -- Keys with prefix <leader>
    { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>f", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>g", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>h", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>t", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>p", function() Snacks.picker.pickers() end, desc = "Pickers" },
    { "<leader>q", function() Snacks.picker.qflist() end, desc = "Quickfix List" },

    -- Keys with prefix <leader>s
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
  },
}
