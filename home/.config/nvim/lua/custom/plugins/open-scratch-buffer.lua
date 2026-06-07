-- Define a command to open a temporary scratch buffer
local function open_scratch_buffer()
  -- Create a new buffer
  vim.cmd('enew')
  vim.api.nvim_buf_set_name(0, '[Scratch Buffer]')

  -- Configure buffer-local options to make it a scratch buffer
  vim.bo.buftype = 'nofile'     -- Not saved as a file
  vim.bo.bufhidden = 'wipe'     -- Delete the buffer when hidden
  vim.bo.swapfile = false       -- No swap file
  vim.bo.buflisted = false      -- Not shown in buffer list (:buffers)

  -- Optionally set filetype or local keymaps
  -- vim.bo.filetype = 'markdown'
end

-- Global keymap
vim.api.nvim_create_user_command('OpenScratchBuffer', open_scratch_buffer, {})

