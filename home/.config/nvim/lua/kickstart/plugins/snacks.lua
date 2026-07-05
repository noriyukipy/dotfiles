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
      main = {
        -- Open a buffer in the current window from picker opened in Oil buffer
        -- https://github.com/folke/snacks.nvim/issues/618
        current = true
      },
      win = {
        input = {
          keys = {
            ["<c-q>"] = { "qflist", mode = { "i", "n" } },
          },
        },
      },
      layout = {
        reverse = false,
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.4,
          -- border = "bold",
          title = " {title} {live} {flags}",
          title_pos = "left",
          position = "bottom",
          {
            box = "vertical",
            { win = "preview", title = "{preview}", border = "bold" },
            { win = "list", border = "none" },
          },
          { win = "input", height = 1, border = "rounded" },
        },
      },
      -- Disable keymap in explorer https://github.com/folke/snacks.nvim/discussions/1407
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                ["/"] = false,
                ["?"] = false,
              },
            },
            list = {
              keys = {
                ["/"] = false,
                ["?"] = false,
              },
            },
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
      shell = "zsh",
      interactive = false,
    }
  },
  keys = {
    { "<leader>b", function() Snacks.explorer() end, desc = "File Explorer" },
  },
}
