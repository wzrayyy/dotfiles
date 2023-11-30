return { 
    "itchyny/lightline.vim",
    config = function()
        vim.g.lightline = { 
            colorscheme = "one",
            enable = {
                tabline = 0
            }
        }
    end
}
