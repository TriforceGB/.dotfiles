return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.nvim", opts = {} } }, -- Needs Mini.icons
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
		require("oil").setup()

		view_options = {
			show_hidden = true,
		}

		-- Keybinds
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}
