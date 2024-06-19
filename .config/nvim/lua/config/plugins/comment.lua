local map = vim.keymap.set

map({ 'n', 'i' }, '<C-_>', require('Comment.api').toggle.linewise.current)

map('v', '<C-_>', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    require('Comment.api').toggle.linewise(vim.fn.visualmode())
  end
)
