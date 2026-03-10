return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- only updates when plugin updates
  -- dependencies = { 'HiPhish/rainbow-delimiters.nvim' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('nvim-treesitter').setup {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'python',
        'java',
        'csv',
        'css',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattriubutes',
        'gitcommit',
        'gitignore',
        'yaml',
        'txt',
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

      rainbow = {
        enable = true,
        termcolors = { 161, 201, 14, 13, 123, 172 },
      },
    }
  end,
}
