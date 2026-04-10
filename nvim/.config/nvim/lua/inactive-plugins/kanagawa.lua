return {
	"rebelot/kanagawa.nvim",
	config = function()
		require('kanagawa').setup({
			compile=true,
			transparent=true,
		})
		vim.cmd.colorscheme('kanagawa');
		-- Color Overrides
		-- vim.api.nvim_set_hl(0, "htmlItalic", { fg = "#00ff00", italic = true})
	end,

	build = function()
		vim.cmd('KanagawaCompile');
	end,
}
