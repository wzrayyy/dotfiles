return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'onsails/lspkind.nvim',
        'L3MON4D3/LuaSnip'
    },

    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local luasnip = require("luasnip")

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },

            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'luasnip' },
            },

            --- @diagnostic disable-next-line: missing-fields
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    show_labelDetails = true,
                    menu = ({
                        buffer = "[BUF]",
                        nvim_lsp = "[LSP]",
                    })
                })
            }
        })
    end
}
