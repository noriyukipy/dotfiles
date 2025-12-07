-- https://nvim-mini.org/mini.nvim/

return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function ()
    require('mini.indentscope').setup({
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 30,
      },
    symbol = '╎',
    })
    require('mini.trailspace').setup({ })
    require('mini.statusline').setup({ })
    -- require('mini.tabline').setup({ })
  end,
}

