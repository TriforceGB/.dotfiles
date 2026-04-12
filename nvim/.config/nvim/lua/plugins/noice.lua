return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = { enabled = false }, -- we use Snacks
		popupmenu = { enabled = true },
		lsp = {
			progress = { enabled = false }, -- Use fidget
			signature = { enabled = false }, -- we use lsp-signature.nvim
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
