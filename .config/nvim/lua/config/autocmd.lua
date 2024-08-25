-- Set proper tabstop for go
vim.api.nvim_create_autocmd('FileType', {
    pattern = "go",
    command = "setlocal tabstop=4",
})
