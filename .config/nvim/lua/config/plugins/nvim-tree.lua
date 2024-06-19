vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = { "help" },
  },
  filters = {
    custom = { '.git' },
  },
})

vim.keymap.set('n', '<C-m>', ':NvimTreeToggle<CR>', { silent=true })
