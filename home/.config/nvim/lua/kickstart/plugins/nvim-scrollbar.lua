return {
  'petertriho/nvim-scrollbar',
  version = '*',
  dependencies = { 'folke/tokyonight.nvim' },
  config = function()
    local colors = require('tokyonight.colors').setup()
    require('scrollbar').setup({
      handle = {
        color = colors.blue7, -- #394b70 暗い青灰色。背景に馴染みつつ青みを感じる
        -- color = colors.blue0, -- #3d59a1 濃紺。はっきり青とわかる。存在感がある
        -- color = colors.blue, -- #7aa2f7 明るい青。最も目立つがやや主張が強い
        -- color = colors.dark3, -- #545c7e 青みがかったグレー。一番おとなしいが視認性は十分
      },
      marks = {
        Cursor = { text = "█", color = colors.blue0 },
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    })
  end,
}

