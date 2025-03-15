return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-context'
    },
    build = ':TSUpdate',
    config = function()
        vim.defer_fn(function()
            --- @diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })

            require('treesitter-context').setup {
                max_lines = 6
            }
        end, 0)
    end
}
