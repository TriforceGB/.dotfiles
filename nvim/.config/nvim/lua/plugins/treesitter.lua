return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Highlighting
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})

		-- Folds
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"

		-- Indentation
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
}
