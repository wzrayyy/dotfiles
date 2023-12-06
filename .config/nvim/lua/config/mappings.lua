local map = vim.keymap.set

-- Unbind keys
map('n', '<C-q>', '<NOP>')
map('v', 'K', '<NOP>')

-- Movement between buffers
map({'n', 'v', 'i'}, '<A-u>', ':bp<CR>')
map({'n', 'v', 'i'}, '<A-i>', ':bn<CR>')

-- Remap for dealing with word wrap
map('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- Exit buffers/nvim with <leader>
map('n', '<leader>q', function() require('utils.close_buffer').close_buffer() end)
map('n', '<leader><C-q>', function() require('utils.close_buffer').close_buffer(true) end)
map('n', '<leader>Q', ':%bd | quit<CR>')
map('n', '<leader>w', ':write<CR>')

-- Copy and paste from clipboard
map('n', '<leader>y', '"+yy<ESC>')
map('v', '<leader>y', '"+y<ESC>')
map({ 'n', 'v' }, '<leader>p', '"+p<ESC>')
map({ 'n', 'v' }, '<leader>P', '"+P<ESC>')
