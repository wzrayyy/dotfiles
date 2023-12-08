require('mason').setup()
require('mason-lspconfig').setup()

local mason_lspconfig = require('mason-lspconfig')

local on_attach = function(_, bufnr)
  require("config.lsp.keybinds").init_keymap(bufnr)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  clangd = require("config.lsp.clangd"),
  pyright = require("config.lsp.pyright"),
  lua_ls = require("config.lsp.lua_ls"),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
