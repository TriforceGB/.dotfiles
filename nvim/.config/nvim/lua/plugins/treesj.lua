return {
	"Wansmer/treesj",
	keys = {
		{ "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle Inline/Block" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		use_default_keymaps = false,
		max_join_length = 1000,
	},
}
