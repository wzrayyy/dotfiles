local M = { }

local function try_quit(command)
  local success, errorMsg = pcall(vim.api.nvim_command, command)
  if not success then
    print("Failed to quit: " .. errorMsg)
  end
end

function M.close_buffer(force)
  local buf_cmd = "bd"
  local quit_cmd = "qa"

  if force then
    buf_cmd = "bd!"
    quit_cmd = "qa!"
  end

  local tree = require("nvim-tree.api").tree
  local buffer_count = #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)')

  if buffer_count == 1 or buffer_count == 0 then
    try_quit(quit_cmd)
  else
    tree.toggle({ focus = false })
    try_quit(buf_cmd)
    tree.toggle({ focus = false })
  end
end

return M
