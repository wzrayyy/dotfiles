return {
    'rcarriga/nvim-notify',
    { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', opts = {} },
    { 'akinsho/bufferline.nvim', config = {} },
    { 'ethanholz/nvim-lastplace', config = {} },
    { 'norcalli/nvim-colorizer.lua', opts = {}, config = function ()
        require('colorizer').setup()
    end },
    { 'nvim-treesitter/nvim-treesitter-context', dependencies = { 'nvim-treesitter/nvim-treesitter' }},
    { 'wakatime/vim-wakatime', event = 'VeryLazy' },

    { 'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
        dependencies = { 'olimorris/onedarkpro.nvim' }
    },

    { 'neovim/nvim-lspconfig', dependencies = {
        'folke/neodev.nvim',
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
    }},
}
