-- Set proper tabstop for go
vim.api.nvim_create_autocmd('FileType', {
    pattern = "go",
    command = "setlocal tabstop=4 noexpandtab",
})

-- Remove trailing whitespaces on save
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function ()
        local view = vim.fn.winsaveview()
        vim.cmd('%s/\\s\\+$//e')
        vim.fn.winrestview(view)
    end
})
