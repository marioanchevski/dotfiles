return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  lazy = false,
  opts = {
    ensure_installed = {
      'c',
      'lua',
      'luadoc',
      'html',
      'css',
      'jsdoc',
      'json',
      'jsonc',
      'javascript',
      'typescript',
      'vim',
      'vimdoc',
      'query',
      'regex',
      'toml',
      'markdown',
      'markdown_inline',
      'go',
      'gomod',
      'gowork',
      'gosum',
      'java',
      'yaml',
      'bash',
      'dockerfile',
      'gitignore',
    },
  },
  config = function(_, opts)
    require('nvim-treesitter').install(opts.ensure_installed)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = opts.ensure_installed,
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
