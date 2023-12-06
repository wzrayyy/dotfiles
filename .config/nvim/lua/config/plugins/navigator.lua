require('Navigator').setup()

local map = vim.keymap.set

map('n', '<A-h>', function () require("Navigator").left() end)
map('n', '<A-j>', function () require("Navigator").down() end)
map('n', '<A-k>', function () require("Navigator").up() end)
map('n', '<A-l>', function () require("Navigator").right() end)
