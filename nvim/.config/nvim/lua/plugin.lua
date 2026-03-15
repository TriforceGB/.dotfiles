-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    -- NOTE: Plugins can be added via a link or github org/name. To run setup automatically, use `opts = {}`
    -- TODO: sort these plugin in some order

    -- Nvim Manager
    require 'plugins.mason', -- Download Needed Program for Plugins
    require 'plugins.mason-tool-installer', -- Extra Tools for Mason

    -- Major Plugin Packs
    require 'plugins.snacks', -- Many small Snack Plugins the Fill a Majorly of Needs
    require 'plugins.mini', -- Collection of Various Mini Plugins

    -- Coding Plugins
    require 'plugins.blink', -- Autocompletion
    require 'plugins.treesitter', -- Treesitter Plugin
    require 'lsp', -- LSP Plugin
    require 'plugins.debug', -- Debug for Nvim
    require 'plugins.python-tools', --addons for python

    -- Visual Plugins
    require 'plugins.catppuccin', -- Theme
    require 'plugins.fidget', -- Display LSP Starting Up
    require 'plugins.rainbow', -- adds rainbow () and {}
    require 'plugins.colorizer', -- shows the color of hex codes
    require 'plugins.todo-comments', -- Highlight todo, notes, etc in comments

    -- Formating Plugins
    require 'plugins.guess-indent', -- guess indent pattern to follow
    require 'plugins.autopairs', -- auto complete () {} and ""

    -- Motions
    require 'plugins.which-key', -- display usable keys for all keymaps:w
    require 'plugins.flash', -- improve navgation
    require 'plugins.tabout', -- lets me tab out of ) or "
    require 'plugins.treesitter-textobjects', -- select based on function
    require 'plugins.treesj', -- more control over lists

    -- Git Plugins
    -- require 'plugins.gitsign', -- bit blame and other visual git features
    require 'plugins.gitsigns', -- adds gitsigns recommend keymaps

    -- Markdown and Obsidian Plugins
    require 'plugins.markdown-render', -- format markdown files

    -- Fun Plugins
    require 'plugins.vim-be-better', -- vim practice

    -- require 'plugins.telescope', -- fzf for nvim
    -- require 'plugins.none-ls', -- Autoformat
    -- require 'plugins.lint', -- linter that helps flag errors
}, {
  ui = {
    -- if you are using a nerd font: set icons to an empty table which will use the
    -- default lazy.nvim defined nerd font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
