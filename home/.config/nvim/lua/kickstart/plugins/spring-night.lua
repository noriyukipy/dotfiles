return {
  'rhysd/vim-color-spring-night',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    vim.g.spring_night_high_contrast = 1
    vim.cmd.colorscheme 'spring-night'
  end,
}
