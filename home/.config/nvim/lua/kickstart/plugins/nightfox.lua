return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup({
      palettes = {},
      specs = {},
      groups = {
        all = {
          -- Set background color of line number.
          -- Check $HOME/.local/share/nvim/lazy/nightfox.nvim/lua/nightfox/palette/terafox.lua
          LineNR = { fg = "fg3", bg = "bg3" },  -- much darker color
        },
      }
    })
  end,
}
