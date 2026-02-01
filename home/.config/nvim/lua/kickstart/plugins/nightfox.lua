return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup({
      palettes = {},
      specs = {},
      groups = {
        all = {
          -- Set background color of line number.
          LineNR = { fg = "fg3", bg = "#122124" },  -- darker color of terafox default bg color gb1=#152528 (deep blue green)
          -- LineNR = { bg = "#101D20" },  -- much darker color
        },
      }
    })
    vim.cmd.colorscheme 'terafox'
  end,
}
