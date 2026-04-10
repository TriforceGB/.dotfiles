-- [[ opition.lua]]
-- Basic Vim / Nvim Settings

-- Use a Nerd Font
vim.g.have_nerd_font = true

-- Make line numbers default with relative numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Sync clipboard between OS and Neovim.
vim.schedule(function() vim.o.clipboard = "unnamedplus" end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes:2"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Hide Command Line
vim.o.cmdheight = 0

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Tab Settings
vim.o.expandtab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Disable the Basic Nvim Signature Help Because of the Use of a Plugin
vim.lsp.handlers["textDocument/signatureHelp"] = function() end
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 20

-- Set Fold Level and Starts with Everything Open
vim.o.foldlevel = 99
vim.o.foldlevelstart = -1

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
vim.o.confirm = true
