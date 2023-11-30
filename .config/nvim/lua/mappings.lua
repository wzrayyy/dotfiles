local map = vim.keymap.set

-- Remap leader
vim.g.mapleader = " "
map('n', '<Space>', '<Nop>')

-- Buffer movements
map("n", "<A-h>", ":bp<CR>")
map("n", "<A-l>", ":bn<CR>")

-- Make use of Shift+hjkl 
map("n", "H", "^")
map("n", "L", "$")
map("n", "<A-j>", "}")
map("n", "<A-k>", "{")

-- Leader remap
map("n", "<Leader>w", ":write<CR>")
map("n", "<Leader>e", ":NvimTreeFocus<CR>")

-- Split movements
map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>l", "<C-w>l")

-- Remap comments
map("n", "<C-_>", require("Comment.api").toggle.linewise.current)
map("i", "<C-_>", require("Comment.api").toggle.linewise.current)
map("x", "<C-_>", function()  -- some evil trickery with comment plugin
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false) 
        require("Comment.api").toggle.linewise(vim.fn.visualmode()) 
    end
)

-- Close buffer and nvim
local close_buffer_and_nvimtree = function()
    local try_quit = function(command)
        local success, errorMsg = pcall(vim.api.nvim_command, command)
        if not success then
            print("Failed to quit: " .. errorMsg)
        end
    end

    local tree = require("nvim-tree.api").tree
    local buffer_count = #vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)')

    if buffer_count == 0 then
        try_quit("quit")
    -- elseif buffer_count == 1 then
    --     vim.cmd("e .")
    --     try_quit("bd")
    --     vim.cmd("NvimTreeClose")
    else
        tree.toggle({ focus = false })
        try_quit("bd")
        tree.toggle({ focus = false })
    end
    -- if buffer_count == 1 and #vim.api.nvim_list_wins() == 1 then
    --     try_quit("quit")
    -- end
end

-- Leader remapping
map("n", "<Leader>q", function() close_buffer_and_nvimtree() end)
map("n", "<Leader>Q", ":%bd | quit<CR>")
map("n", "<Leader><C-Q>", ":%bd! | quit!<CR>")
map("n", "<Leader><C-Q>", ":%bd! | quit!<CR>")

map("v", "<Leader>y", '"+y')
map("n", "<Leader>y", '"+yy')

map({ "n", "v" }, "<Leader>p", '"+p')
map({ "n", "v" }, "<Leader>P", '"+P')

-- Toggle tree
map("n", "<C-b>", function() require("nvim-tree.api").tree.toggle({ focus=false }) end)

