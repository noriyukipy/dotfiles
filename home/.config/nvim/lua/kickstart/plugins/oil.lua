-- https://github.com/stevearc/oil.nvim
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function ()
    require('oil').setup({
      default_file_explorer = false,
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["q"] = ":q<CR>",
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>e", ":Oil<CR>")
  end,
}
