-- https://github.com/stevearc/oil.nvim
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- Install Cica font to show icons on terminal.
  -- Use nvim-web-devicons because mini.icons does not show some file font icons with Cica font.
  -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function ()
    require('oil').setup({
      default_file_explorer = false,
      delete_to_trash = true,
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["q"] = { "actions.close", mode = "n" },
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>e", ":Oil<CR>")
  end,
}
