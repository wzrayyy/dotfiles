-- Highlight search results
vim.o.hlsearch = true

-- Enable line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Indentation
vim.o.tabstop = 8
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.softtabstop = -1

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Enable TrueColor
vim.o.termguicolors = true

vim.o.splitbelow = true
vim.o.splitright = true
