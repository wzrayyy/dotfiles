return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'navarasu/onedark.nvim',
        'nvim-lua/plenary.nvim',
        'xiyaowong/telescope-emoji.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
            },
        }

        require('telescope').load_extension('fzf')
        require('telescope').load_extension('emoji')

        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
                winblend = 10,
                previewer = true,
            })
        end)

        vim.keymap.set('n', '<leader>?',  require('telescope.builtin').live_grep)
        vim.keymap.set('n', '<leader>wf',  require('telescope.builtin').grep_string)
        vim.keymap.set('n', '<leader>of', require('telescope.builtin').oldfiles)
        vim.keymap.set('n', '<leader>af', require('telescope.builtin').git_files)
        vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
        vim.keymap.set('n', '<leader>.',  require('telescope').extensions.emoji.emoji)
    end
}
