local map = vim.keymap.set

-- Movements between splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Movement between buffers
map({'n', 'v', 'i'}, '<A-h>', ':bp<CR>')
map({'n', 'v', 'i'}, '<A-l>', ':bn<CR>')

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Exit buffers/nvim with <leader>
map("n", "<leader>q", function() require('utils.close_buffer').close_buffer() end)
map("n", "<leader>Q", ":%bd | quit<CR>")
map("n", "<leader><C-Q>", ":%bd! | quit!<CR>")
map("n", "<leader>w", ":write<CR>")

-- Copy and paste from clipboard
map("n", "<leader>y", '"+yy')
map("v", "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')

-- Remap comments
map("n", "<C-_>", require("Comment.api").toggle.linewise.current)
map("i", "<C-_>", require("Comment.api").toggle.linewise.current)
map("x", "<C-_>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    require("Comment.api").toggle.linewise(vim.fn.visualmode())
  end
)
