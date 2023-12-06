-- Open NvimTree on startup
local function open_nvim_tree(data)
    local real_file = vim.fn.filereadable(data.file) == 1
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    local directory = vim.fn.isdirectory(data.file) == 1

    if real_file or no_name then
        require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
    elseif directory then
        vim.cmd.enew()
        vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
    end
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Resotre cursor on exit
-- vim.api.nvim_create_autocmd("VimLeave", {
--   pattern = "*",
--   callback = function()
--     vim.o.guicursor = "n:ver20-blinkwait700-blinkoff400-blinkon250"
--   end,
-- })
