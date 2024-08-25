return {
    'navarasu/onedark.nvim',
    config = function()
        require('onedark').setup {
            style = 'darker',
            transparent = false,
            term_colors = false,
            ending_tildes = false,
            cmp_itemkind_reverse = false,

            code_style = {
                comments = 'italic',
                keywords = 'none',
                functions = 'none',
                strings = 'none',
                variables = 'none'
            },

            lualine = {
                transparent = true,
            },

            colors = {
                bg0 = "#101010",
                bg1 = "#1a1a1a",
                bg2 = "#151515",
                bg3 = "#242424",
                bg_d = "#101010",
                fg = "#c6c6c6",
            },
            highlights = {},

            diagnostics = {
                darker = true,
                undercurl = true,
                background = true,
            },
        }
        vim.o.termguicolors = true
        vim.cmd.colorscheme 'onedark'
    end,
}
