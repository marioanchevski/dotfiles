return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    on_attach = function(bufnr)
      local gs = require 'gitsigns'

      local function map(mode, keys, func)
        vim.keymap.set(mode, keys, func, { buffer = bufnr })
      end

      map('n', '[h', gs.prev_hunk)
      map('n', ']h', gs.next_hunk)

      map('n', '<leader>hs', gs.stage_hunk)
      map('n', '<leader>hr', gs.reset_hunk)
      map('n', '<leader>hu', gs.undo_stage_hunk)

      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hR', gs.reset_buffer)

      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hd', gs.diffthis)
    end,
  },
}
