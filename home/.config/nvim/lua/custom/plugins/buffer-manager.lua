local M = {}

local FILETYPE = "bufmgr"

local function list_buffers()
  local entries = {}
  for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1, bufloaded = 1 })) do
    local name = info.name
    if name == "" then name = "[No Name]" end
    -- Sort the buffer list by most recent accessed
    table.insert(entries, { bufnr = info.bufnr, name = name, lastused = info.lastused })
  end
  table.sort(entries, function(a, b) return a.lastused > b.lastused end)
  return entries
end

local function render(buf, entries)
  local lines = {}
  for _, e in ipairs(entries) do
    table.insert(lines, string.format("%d\t%s", e.bufnr, e.name))
  end
  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modified = false
end

local function parse_bufnr(line)
  local n = line:match("^(%d+)\t")
  return n and tonumber(n) or nil
end

local function on_write(buf, original)
  local kept = {}
  for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    local nr = parse_bufnr(line)
    if nr then kept[nr] = true end
  end

  for _, e in ipairs(original) do
    if not kept[e.bufnr] and vim.api.nvim_buf_is_valid(e.bufnr) then
      pcall(vim.api.nvim_buf_delete, e.bufnr, { force = false })
    end
  end

  local refreshed = list_buffers()
  render(buf, refreshed)
  return refreshed
end

function M.open()
  local prev_buf = vim.api.nvim_get_current_buf()
  if vim.bo[prev_buf].filetype == FILETYPE then
    return
  end

  local entries = list_buffers()
  local buf = vim.api.nvim_create_buf(false, true) -- listed=false, scratch=true

  vim.bo[buf].buftype = "acwrite"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = FILETYPE
  vim.api.nvim_buf_set_name(buf, "[bufmgr]")

  render(buf, entries)
  vim.api.nvim_set_current_buf(buf)

  -- Place the cursor on the line of the previously showwn buffer
  for i, e in ipairs(entries) do
    if e.bufnr == prev_buf then
      vim.api.nvim_win_set_cursor(0, { i, 0 })
      break
    end
  end

  local state = { entries = entries }

  vim.api.nvim_create_autocmd("BufWriteCmd", {
    buffer = buf,
    callback = function()
      state.entries = on_write(buf, state.entries)
    end,
  })

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_buf_is_valid(prev_buf) and vim.bo[prev_buf].buflisted then
      vim.api.nvim_set_current_buf(prev_buf)
    else
      vim.notify("Previous buffer no longer exists. Select new one to open", vim.log.levels.WARN)
    end
  end, { buffer = buf, silent = true })

  local function open_with(pre_cmd)
    return function()
      local line = vim.api.nvim_get_current_line()
      local nr = parse_bufnr(line)
      if not nr or not vim.api.nvim_buf_is_valid(nr) then
        vim.notify("No buffer on this line", vim.log.levels.WARN)
        return
      end
      if pre_cmd then vim.cmd(pre_cmd) end
      vim.api.nvim_set_current_buf(nr)
    end
  end

  vim.keymap.set("n", "<CR>",  open_with(nil),       { buffer = buf, silent = true })
  vim.keymap.set("n", "<C-v>", open_with("vsplit"),  { buffer = buf, silent = true })
  vim.keymap.set("n", "<C-s>", open_with("split"),   { buffer = buf, silent = true })
  vim.keymap.set("n", "<C-t>", open_with("tabnew"),  { buffer = buf, silent = true })
end

-- Global keymap
vim.api.nvim_create_user_command("BufMgr", M.open, {})
vim.keymap.set("n", "<leader><leader>", M.open, { desc = "Buffer manager" })

