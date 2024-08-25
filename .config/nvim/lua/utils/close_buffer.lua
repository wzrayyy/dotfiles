local M = { }

function M.close_buffer(force)
    if #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)') <= 1 then
        vim.api.nvim_command("qa" .. (force and "!" or ""))
    else
        local tree = require("nvim-tree.api").tree

        tree.toggle({ focus = false })
        vim.api.nvim_command("bd" .. (force and "!" or ""))
        tree.toggle({ focus = false })
    end
end

return M
