return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      pickers = {
        find_files = {
          theme = 'ivy',
        },
      },
    }
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-s>'] = actions.select_vertical,
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>pf', function()
      print 'hello mortal'
    end)
    -- p for project
    vim.keymap.set('n', '<leader>pf', builtin.find_files)
    vim.keymap.set('n', '<leader>pg', builtin.live_grep)
    vim.keymap.set('n', '<leader>ph', builtin.help_tags)
    vim.keymap.set('n', '<leader>pb', builtin.buffers)
    vim.keymap.set('n', '<leader>pd', builtin.diagnostics)
    vim.keymap.set('n', '<leader>po', builtin.oldfiles)

    telescope.load_extension 'fzf'
  end,
}
