return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" }, -- ??
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" }, -- useless?
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" }, -- nice as well
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>" }, -- nicee
        { "<leader>xL", "<cmd>Trouble loclist toggle<cr>" }, -- ??
        { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>" }, -- ??
    },
}
