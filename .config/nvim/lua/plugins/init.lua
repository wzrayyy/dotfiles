return {
    'rcarriga/nvim-notify',
    'psliwka/vim-smoothie',
    'stefandtw/quickfix-reflector.vim',
    'tpope/vim-sleuth',
    { 'akinsho/bufferline.nvim', opts = {}, dependencies = { 'navarasu/onedark.nvim' } },
    { 'ethanholz/nvim-lastplace', opts = {} },
    { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', opts = {} },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    { 'norcalli/nvim-colorizer.lua', opts={ '*' }, dependencies = { 'navarasu/onedark.nvim' } },
    { 'wakatime/vim-wakatime', event = 'VeryLazy' },
    { 'williamboman/mason.nvim', opts = {} },
}
