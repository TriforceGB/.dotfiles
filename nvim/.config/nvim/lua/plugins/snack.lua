return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = 'header' },
				{ section = 'keys', gap = 1, padding = 1 },
				-- { section = 'terminal', cmd = 'ascii-image-converter "${HOME}/.config/nvim/frontImage.png" -C -c', random = 10, pane = 2, indent = 8, height = 40 }, -- Change this to something else????? maybe just 
				{ icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 2, 2 } },
				{ icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2 },
				{ section = 'startup' },
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = {
			enabled = true,
			layout = {
				cycle = true,
				--- Use the default layout or vertical if the window is too narrow
				preset = function()
					return vim.o.columns >= 120 and "default" or "vertical"
				end,
			},
			matcher = {
				frecency = true,
			},
			debug = {
				scores = false,
			}
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		scratch = {
			win_by_ft = {
				python = {
					keys = {
						["source"] = {
							"<cr>",
							function(self)
								local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
								Snacks.debug.run({ buf = self.buf, name = name })
							end,
							desc = "Source buffer",
							mode = { "n", "x" },
						},
					},
				},
			},
		},

		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{ '<C-space>', function() Snacks.picker.smart() end, desc = 'Smart Find Files' },
		{ '<leader>,', function() Snacks.picker.buffers() end, desc = 'Buffers' },
		{ '<leader>/', function() Snacks.picker.grep() end, desc = 'Grep' },
		{ '<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History' },
		{ '<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History' },
		{ '\\', function() Snacks.explorer() end, desc = 'File Explorer' },
		-- find
		{ '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
		{ '<leader>fc', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, desc = 'Find Config File' },
		{ '<leader>ff', function() Snacks.picker.files() end, desc = 'Find Files' },
		{ '<leader>fg', function() Snacks.picker.git_files() end, desc = 'Find Git Files' },
		{ '<leader>fp', function() Snacks.picker.projects() end, desc = 'Projects' },
		{ '<leader>fr', function() Snacks.picker.recent() end, desc = 'Recent' },
		-- git
		{ '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
		{ '<leader>gl', function() Snacks.picker.git_log() end, desc = 'Git Log' },
		{ '<leader>gL', function() Snacks.picker.git_log_line() end, desc = 'Git Log Line' },
		{ '<leader>gs', function() Snacks.picker.git_status() end, desc = 'Git Status' },
		{ '<leader>gS', function() Snacks.picker.git_stash() end, desc = 'Git Stash' },
		{ '<leader>gd', function() Snacks.picker.git_diff() end, desc = 'Git Diff (Hunks)' },
		{ '<leader>gf', function() Snacks.picker.git_log_file() end, desc = 'Git Log File' },
		-- gh
		{ '<leader>gi', function() Snacks.picker.gh_issue() end, desc = 'GitHub Issues (open)' },
		{ '<leader>gI', function() Snacks.picker.gh_issue { state = 'all' } end, desc = 'GitHub Issues (all)' },
		{ '<leader>gp', function() Snacks.picker.gh_pr() end, desc = 'GitHub Pull Requests (open)' },
		{ '<leader>gP', function() Snacks.picker.gh_pr { state = 'all' } end, desc = 'GitHub Pull Requests (all)' },
		-- Grep
		{ '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
		{ '<leader>sB', function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers' },
		{ '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
		{ '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },
		-- search
		{ '<leader>s"', function() Snacks.picker.registers() end, desc = 'Registers' },
		{ '<leader>s/', function() Snacks.picker.search_history() end, desc = 'Search History' },
		{ '<leader>sa', function() Snacks.picker.autocmds() end, desc = 'Autocmds' },
		{ '<leader>sb', function() Snacks.picker.lines() end, desc = 'Buffer Lines' },
		{ '<leader>sc', function() Snacks.picker.command_history() end, desc = 'Command History' },
		{ '<leader>sC', function() Snacks.picker.commands() end, desc = 'Commands' },
		{ '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
		{ '<leader>sD', function() Snacks.picker.diagnostics_buffer() end, desc = 'Buffer Diagnostics' },
		{ '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Pages' },
		{ '<leader>sH', function() Snacks.picker.highlights() end, desc = 'Highlights' },
		{ '<leader>si', function() Snacks.picker.icons() end, desc = 'Icons' },
		{ '<leader>sj', function() Snacks.picker.jumps() end, desc = 'Jumps' },
		{ '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
		{ '<leader>sl', function() Snacks.picker.loclist() end, desc = 'Location List' },
		{ '<leader>sm', function() Snacks.picker.marks() end, desc = 'Marks' },
		{ '<leader>sM', function() Snacks.picker.man() end, desc = 'Man Pages' },
		{ '<leader>sp', function() Snacks.picker.lazy() end, desc = 'Search for Plugin Spec' },
		{ '<leader>sq', function() Snacks.picker.qflist() end, desc = 'Quickfix List' },
		{ '<leader>sR', function() Snacks.picker.resume() end, desc = 'Resume' },
		{ '<leader>su', function() Snacks.picker.undo() end, desc = 'Undo History' },
		{ '<leader>uC', function() Snacks.picker.colorschemes() end, desc = 'Colorschemes' },
		-- LSP
		{ 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
		{ 'gD', function() Snacks.picker.lsp_declarations() end, desc = 'Goto Declaration' },
		{ 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
		{ 'gI', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
		{ 'gy', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition' },
		{ 'gai', function() Snacks.picker.lsp_incoming_calls() end, desc = 'C[a]lls Incoming' },
		{ 'gao', function() Snacks.picker.lsp_outgoing_calls() end, desc = 'C[a]lls Outgoing' },
		{ '<leader>ss', function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols' },
		{ '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
		-- Todo
		{ "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
		{ "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
		-- Other
		{ '<leader>z', function() Snacks.zen() end, desc = 'Toggle Zen Mode' },
		-- { '<leader>Z', function() Snacks.zen.zoom() end, desc = 'Toggle Zoom' },
		{ '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer' },
		{ '<leader>S', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
		{ '<leader>n', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
		{ '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
		{ '<leader>cR', function() Snacks.rename.rename_file() end, desc = 'Rename File' },
		{ '<leader>gw', function() Snacks.gitbrowse() end, desc = 'Git Web', mode = { 'n', 'v' } },
		{ '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
		{ '<leader>gB', function() Snacks.git.blame_line() end, desc = 'Git Blame Line' },
		{ '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications' },
		{ '<leader><enter>', function() Snacks.terminal.toggle() end, desc = 'Toggle Terminal' },
		{ '<c-_>', function() Snacks.terminal() end, desc = 'which_key_ignore' },
		{ ']]', function() Snacks.words.jump(vim.v.count1) end, desc = 'Next Reference', mode = { 'n', 't' } },
		{ '[[', function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
		-- {
		-- 	'<leader>n',
		-- 	desc = 'neovim news',
		-- 	function()
		-- 		snacks.win {
		-- 			file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
		-- 			width = 0.6,
		-- 			height = 0.6,
		-- 			wo = {
		-- 				spell = false,
		-- 				wrap = false,
		-- 				signcolumn = 'yes',
		-- 				statuscolumn = ' ',
		-- 				conceallevel = 3,
		-- 			},
		-- 		}
		-- 	end,
		-- },
	},
	init = function()
		vim.api.nvim_create_autocmd('user', {
			pattern = 'verylazy',
			callback = function()
				-- setup some globals for debugging (lazy-loaded)
				_g.dd = function(...) snacks.debug.inspect(...) end
				_g.bt = function() snacks.debug.backtrace() end

				-- override print to use snacks for `:=` command
				if vim.fn.has 'nvim-0.11' == 1 then
					vim._print = function(_, ...) dd(...) end
				else
					vim.print = _g.dd
				end

				-- create some toggle mappings
				snacks.toggle.option('spell', { name = 'spelling' }):map '<leader>us'
				snacks.toggle.option('wrap', { name = 'wrap' }):map '<leader>uw'
				snacks.toggle.option('relativenumber', { name = 'relative number' }):map '<leader>ul'
				snacks.toggle.diagnostics():map '<leader>ud'
				snacks.toggle.line_number():map '<leader>ul'
				snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
				snacks.toggle.treesitter():map '<leader>ut'
				snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'dark background' }):map '<leader>ub'
				snacks.toggle.inlay_hints():map '<leader>uh'
				snacks.toggle.indent():map '<leader>ug'
				snacks.toggle.dim():map '<leader>ud'
			end,
		})
	end,
}
