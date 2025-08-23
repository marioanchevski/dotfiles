vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('mygroup', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
