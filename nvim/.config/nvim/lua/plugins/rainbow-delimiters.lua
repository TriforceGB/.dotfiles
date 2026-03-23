return {
	"HiPhish/rainbow-delimiters.nvim",
	-- Or "BufReadPost" if you want it earlier
	event = { 'BufReadPost', 'BufNewFile', 'BufWritePre', 'VeryLazy' },
}
