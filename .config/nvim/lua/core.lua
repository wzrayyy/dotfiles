-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Enable syntax highlighting
vim.opt.termguicolors = true
vim.opt.syntax = on

-- Enable undo after closing vim
vim.opt.undofile = true

-- vim.g.lightline = { colorscheme = "one" }

-- Autostart nvim-tree
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

