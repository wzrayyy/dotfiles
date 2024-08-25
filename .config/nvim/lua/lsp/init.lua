local servers = {
    clangd = {},
    pyright = {},
    lua_ls = require('lsp.lua_ls'),
    gopls = {},
    rust_analyzer = {},
    bashls = {},
    hls = {},
}

vim.lsp.set_log_level("debug")

local on_attach = function(_, bufnr)
    local nmap = function(keys, func)
        vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    nmap('<leader>rn', vim.lsp.buf.rename)
    nmap('<leader>ca', vim.lsp.buf.code_action)

    nmap('gd', require('telescope.builtin').lsp_definitions)
    nmap('gr', require('telescope.builtin').lsp_references)
    nmap('gt', require('telescope.builtin').lsp_type_definitions)

    nmap('<leader>sd', require('telescope.builtin').diagnostics)
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols)
    nmap('<leader>as', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    nmap("<leader>i", vim.diagnostic.open_float)
    nmap('K', vim.lsp.buf.hover)
    nmap('<C-k>', vim.lsp.buf.signature_help)

    nmap('gI', require('telescope.builtin').lsp_implementations)
    nmap('gD', vim.lsp.buf.declaration)

    nmap('<leader>F', vim.lsp.buf.format)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

for server_name, config in pairs(servers) do
    lspconfig[server_name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { [server_name] = config },
    })
end

for server_name, config in pairs(servers) do
    lspconfig[server_name].setup(vim.tbl_deep_extend('keep', {
        capabilities = capabilities,
        on_attach = on_attach,
    }, config))
end
