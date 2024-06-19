local map = vim.keymap.set

-- Unbind keys
map('n', '<C-q>', '<NOP>')
-- map('v', 'K', '<NOP>')

-- Movement between buffers
map({ 'n', 'v' }, '<A-u>', ':bp<CR>', { silent = true })
map({ 'n', 'v' }, '<A-i>', ':bn<CR>', { silent = true })

-- Remap for dealing with word wrap
map({ 'n', 'v' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map({ 'n', 'v' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- Exit buffers/nvim with <leader>
map('n', '<leader>q', function() require('utils.close_buffer').close_buffer() end)
map('n', '<leader>1', function() require('utils.close_buffer').close_buffer(true) end)
map('n', '<leader>Q', ':%bd | quit<CR>')
map('n', '<leader>!', ':%bd! | quit!<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>W', function() vim.cmd.write(vim.fn.input("File: ")) end)
map('n', '<leader>e', ':e<CR>')

-- Duplicate leader feats to gradually move to
map('n', '<C-q>', function() require('utils.close_buffer').close_buffer() end)
map('n', '<C-1>', function() require('utils.close_buffer').close_buffer(true) end)

-- Copy and paste from clipboard
map('n', '<leader>y', '"+yy<ESC>')
map('v', '<leader>y', '"+y<ESC>')
map({ 'n', 'v' }, '<leader>p', '"+p<ESC>')
map({ 'n', 'v' }, '<leader>P', '"+P<ESC>')

-- buffer size
map({ 'n', 'v' }, '<leader>n', '<C-w>10<')
map({ 'n', 'v' }, '<leader>m', '<C-w>10>')
map({ 'n', 'v' }, '<leader>N', '<C-w>6-')
map({ 'n', 'v' }, '<leader>M', '<C-w>6+')

-- Remap <M-BS> to remove last word
map('i', '<M-BS>', '<C-w>')

map('n', '<leader>F', function() vim.lsp.buf.format() end)

map('n', '<C-M-k>', ':m-2<CR>', { silent = true })
map('n', '<C-M-j>', ':m+1<CR>', { silent = true })
