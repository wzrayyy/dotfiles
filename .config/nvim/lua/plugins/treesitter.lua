return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
    build = ':TSUpdate',
    config = function()
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end, 0)
    end
}
