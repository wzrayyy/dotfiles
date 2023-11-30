require("utils").init_lazy()

require("lazy").setup{
    require("configs.plugins.bufferline"),
    require("configs.plugins.comment"),
    require("configs.plugins.devicons"),
    require("configs.plugins.lastplace"),
    require("configs.plugins.lightline"),
    require("configs.plugins.lspconfig"),
    require("configs.plugins.nvim-tree"),
    require("configs.plugins.onedark"),
    require("configs.plugins.treesitter"),
}
