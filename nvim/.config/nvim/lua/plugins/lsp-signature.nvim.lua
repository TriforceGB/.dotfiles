return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	opts = {
		bind = true,
		hint_enable = false,
		handler_opts = {
			border = "rounded",
		},
	},
	keys = {
		{
			"K",
			function()
				require("lsp_signature").toggle_float_win()
			end,
			mode = "n",
			silent = true,
			noremap = true,
			desc = "toggle signature",
		},
	},
}
