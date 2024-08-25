return {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
        vim.keymap.set({ 'n', 'i' }, '<C-_>', require('Comment.api').toggle.linewise.current)
        vim.keymap.set('v', '<C-_>', function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
            require('Comment.api').toggle.linewise(vim.fn.visualmode())
        end
        )
    end
}
