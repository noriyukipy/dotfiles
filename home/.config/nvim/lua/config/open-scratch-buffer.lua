local M = {}

function M.open()
  vim.cmd('enew')
  vim.api.nvim_buf_set_name(0, '[Scratch Buffer]')

  vim.bo.buftype = 'nofile'     -- Not saved as a file
  vim.bo.bufhidden = 'wipe'     -- Delete the buffer when hidden
  vim.bo.swapfile = false       -- No swap file
  vim.bo.buflisted = false      -- Not shown in buffer list (:buffers)
end

return M
