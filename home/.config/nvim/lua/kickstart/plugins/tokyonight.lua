return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_highlights = function(hl, c)
      -- Line number colors: dim orange for inactive lines, bright orange for the cursor line.
      local dim_orange = '#8a5a3b'
      hl.LineNr = { fg = dim_orange }
      hl.LineNrAbove = { fg = dim_orange }
      hl.LineNrBelow = { fg = dim_orange }
      hl.CursorLineNr = { fg = c.orange, bold = true }

      -- Autocomplete (Pmenu) colors
      hl.Pmenu = { bg = c.bg_popup, fg = c.fg }
      hl.PmenuSel = { bg = c.bg_highlight, bold = true }
    end,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight-moon'

    -- Set color for auto-complete preinsert option
    local colors = require('tokyonight.colors').setup()
    vim.api.nvim_set_hl(0, 'PreInsert', { fg = colors.fg_dark, italic = true })
  end
}

