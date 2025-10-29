return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c',
        'lua',
        'html',
        'css',
        'json',
        'javascript',
        'typescript',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'go',
        'java',
        'yaml',
        'bash',
        'dockerfile',
        'gitignore',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enabled = true,
      },
    }
  end,
}
