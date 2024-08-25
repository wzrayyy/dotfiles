return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        }

        pcall(require('telescope').load_extension, 'fzf')


        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
                winblend = 10,
                previewer = true,
            })
        end)

        vim.keymap.set('n', '<leader>?', require('telescope.builtin').live_grep)
        vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles)
        vim.keymap.set('n', '<leader>af', require('telescope.builtin').git_files)
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
        vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
        vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string)
        vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
        vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume)
        vim.keymap.set('n', '<leader>sm', require('telescope.builtin').treesitter)
    end
}
