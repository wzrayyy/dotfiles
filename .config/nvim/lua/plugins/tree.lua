return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'navarasu/onedark.nvim' },
    config = function()
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
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })

        vim.keymap.set('n', 'Ā', ':NvimTreeToggle<CR>', { silent = true })
    end
}
