return {
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      {
        'mason-org/mason.nvim',
        opts = {},
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'stylua',
            'prettier',
            'prettierd',
          },
        },
      },
    },
    opts = {
      ensure_installed = {
        'lua_ls',
        'gopls',
        'pyright',
      },
      automatic_enable = false,
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        -- when this file gets sources make sure to clear all the defined
        -- autocmds for this group before running the callback
        group = vim.api.nvim_create_augroup('LspGroup', { clear = true }),
        callback = function(event)
          local map = function(mode, keys, func)
            vim.keymap.set(mode, keys, func, { buffer = event.buf })
          end

          map('n', 'grr', vim.lsp.buf.rename)
          map('n', '<leader>gd', vim.lsp.buf.declaration)
          map('n', '<leader>ca', vim.lsp.buf.code_action)
          map('n', '<leader>gr', require('telescope.builtin').lsp_references)

          map('n', '<leader>gi', require('telescope.builtin').lsp_implementations)
          map('n', 'gd', require('telescope.builtin').lsp_definitions)
          map('n', 'gO', require('telescope.builtin').lsp_document_symbols)
        end,
      })

      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(nil, true),
      })

      vim.lsp.enable {
        'lua_ls',
        'gopls',
        'pyright',
      }
    end,
  },
}
