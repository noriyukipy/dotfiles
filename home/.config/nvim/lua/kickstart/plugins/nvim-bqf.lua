local fn = vim.fn

local function qftf(info)
  local items
  local ret = {}
  if info.quickfix == 1 then
    items = fn.getqflist({ id = info.id, items = 0 }).items
  else
    items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
  end
  local limit = 31
  local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
  local validFmt = '%s │%5d:%-3d│%s %s'
  for i = info.start_idx, info.end_idx do
    local e = items[i]
    local fname = ''
    local str
    if e.valid == 1 then
      if e.bufnr > 0 then
        fname = fn.bufname(e.bufnr)
        if fname == '' then
          fname = '[No Name]'
        else
          fname = fn.fnamemodify(fname, ':p:.')
          fname = fname:gsub('^' .. vim.pesc(vim.env.HOME), '~')
        end
      end
      -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
      if #fname <= limit then
        fname = fnameFmt1:format(fname)
      else
        fname = fnameFmt2:format(fname:sub(1 - limit))
      end
      local lnum = e.lnum > 99999 and -1 or e.lnum
      local col = e.col > 999 and -1 or e.col
      local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
      str = validFmt:format(fname, lnum, col, qtype, e.text)
    else
      str = e.text
    end
    table.insert(ret, str)
  end
  return ret
end

-- v:lua can only see globals, so expose qftf via _G as a bridge for vim.o.qftf.
_G.qftf = qftf

return {
  "kevinhwang91/nvim-bqf",
  dependencies = {
    { 'junegunn/fzf', run = ':call fzf#install()' },
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  },
  ft = "qf",
  init = function()
    vim.o.qftf = '{info -> v:lua.qftf(info)}'
  end,
}
