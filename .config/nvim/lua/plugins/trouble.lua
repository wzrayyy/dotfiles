return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        { "<leader>ew", "<cmd>Trouble diagnostics toggle<cr>" },
        { "<leader>ef", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
        { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
        { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>" },
    },
}
