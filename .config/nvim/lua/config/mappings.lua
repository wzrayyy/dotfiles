local map = vim.keymap.set

-- Unbind keys
map('n', '<C-q>', '<NOP>')
map({ 'n', 'v' }, 'H', '<NOP>')
map({ 'n', 'v' }, 'L', '<NOP>')
map({ 'n', 'v' }, '<C-Space>', '<NOP>')

-- Movement between buffers
map({ 'n', 'v' }, '<A-u>', ':bp<CR>', { silent = true })
map({ 'n', 'v' }, '<A-i>', ':bn<CR>', { silent = true })

-- Remap for dealing with word wrap
map({ 'n', 'v' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })
map({ 'n', 'v' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })

-- Duplicate leader feats to gradually move to
map('n', '<C-q>', function() require('utils.close_buffer').close_buffer() end)

-- Copy and paste from clipboard
map({ 'n', 'v' }, '<leader>y', '"+y')
map({ 'n', 'v' }, '<leader>p', '"+p<ESC>')
map({ 'n', 'v' }, '<leader>P', '"+P<ESC>')

-- buffer size
map({ 'n', 'v' }, '<leader>n', '<C-w>10<')
map({ 'n', 'v' }, '<leader>m', '<C-w>10>')
map({ 'n', 'v' }, '<leader>N', '<C-w>6-')
map({ 'n', 'v' }, '<leader>M', '<C-w>6+')

-- Remap <M-BS> to remove last word
map('i', '<M-BS>', '<C-w>')

map('n', '<C-M-k>', ':m-2<CR>', { silent = true })
map('n', '<C-M-j>', ':m+1<CR>', { silent = true })
