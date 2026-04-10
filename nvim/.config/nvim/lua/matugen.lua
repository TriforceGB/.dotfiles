local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		-- Background tones
		base00 = "#0c141b", -- Default Background
		base01 = "#182127", -- Lighter Background (status bars)
		base02 = "#232b32", -- Selection Background
		base03 = "#8293a2", -- Comments, Invisibles
		-- Foreground tones
		base04 = "#b7c9d9", -- Dark Foreground (status bars)
		base05 = "#dbe3ed", -- Default Foreground
		base06 = "#dbe3ed", -- Light Foreground
		base07 = "#dbe3ed", -- Lightest Foreground
		-- Accent colors
		base08 = "#ffb4ab", -- Variables, XML Tags, Errors
		base09 = "#95cdf8", -- Integers, Constants
		base0A = "#80d5cf", -- Classes, Search Background
		base0B = "#4edad3", -- Strings, Diff Inserted
		base0C = "#95cdf8", -- Regex, Escape Chars
		base0D = "#4edad3", -- Functions, Methods
		base0E = "#80d5cf", -- Keywords, Storage
		base0F = "#93000a", -- Deprecated, Embedded Tags
	})
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
	"sigusr1",
	vim.schedule_wrap(function()
		package.loaded["matugen"] = nil
		require("matugen").setup()
	end)
)

return M
