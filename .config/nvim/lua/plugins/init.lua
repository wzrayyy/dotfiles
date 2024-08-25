return {
    'rcarriga/nvim-notify',
    'stefandtw/quickfix-reflector.vim',
    { 'akinsho/bufferline.nvim', config = {}, dependencies = { 'navarasu/onedark.nvim' } },
    { 'ethanholz/nvim-lastplace', config = {} },
    { 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', opts = {} },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    { 'norcalli/nvim-colorizer.lua', opts = {}, dependencies = { 'navarasu/onedark.nvim' } },
    { 'wakatime/vim-wakatime', event = 'VeryLazy' },
    { 'williamboman/mason.nvim', opts = {} },
}
