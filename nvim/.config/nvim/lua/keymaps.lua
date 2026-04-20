-- [[ Basic  Keymaps ]]
-- NOTE: Keysmaps for Plugins are found in the plugin File Rather then here
-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Show diagnostics under the cursor" })

vim.keymap.set(
	"n",
	"<leader>cf",
	function() require("conform").format({ lsp_format = "fallback" }) end,
	{ desc = "[C]ode [F]ormat" }
)

-- Debugging
vim.keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>"
)
vim.keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>")
-- vim.keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "Shift+<F11>", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end)
vim.keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", "<leader>di", function() require("dap.ui.widgets").hover() end)
vim.keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
