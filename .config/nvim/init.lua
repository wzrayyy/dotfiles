-- Remap leader key to <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Load modules
require("config")
require("utils.lazy").lazy_init()
require("lazy").setup("plugins", {
    change_detection = {
        enabled = false,
        notify = false,
    },
})
require("config.lsp")
