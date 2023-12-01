local M = { }

function M.close_buffer()
    local try_quit = function(command)
        local success, errorMsg = pcall(vim.api.nvim_command, command)
        if not success then
            print("Failed to quit: " .. errorMsg)
        end
    end

    local tree = require("nvim-tree.api").tree
    local buffer_count = #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)')

    if buffer_count ~= 1 then
      tree.toggle({ focus = false })
      try_quit("bd")
      tree.toggle({ focus = false })
    else
        try_quit("qa")
    end
end

return M
