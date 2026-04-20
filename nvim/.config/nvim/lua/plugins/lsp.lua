return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- Mason must be loaded before its dependents so we need to set it up here.
		{
			"mason-org/mason.nvim",
			---@module 'mason.settings'
			---@type MasonSettings
			---@diagnostic disable-next-line: missing-fields
			opts = {},
		},
		-- Maps LSP server names between nvim-lspconfig and Mason package names.
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				-- local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- if client and client:supports_method('textDocument/documentHighlight', event.buf) then
				local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
					end,
				})
			end,

			-- -- NOTE: The following code creates a keymap to toggle inlay hints in your code, if the language server you are using supports them This may be unwanted, since they displace some of your code
			-- if client and client:supports_method('textDocument/inlayHint', event.buf) then
			-- 	map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
			-- end
		})

		-- Diagnostic Config
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "󰀪",
					[vim.diagnostic.severity.INFO] = "󰋽",
					[vim.diagnostic.severity.HINT] = "󰌶",
				},
			},
			virtual_text = {
				prefix = "●", -- icon before the message, can use a nerd font icon too
				spacing = 4, -- spaces between code and message
				source = "if_many", -- shows source (e.g. "eslint") if multiple LSPs active
			},
			float = {
				border = "rounded",
				source = true, -- shows e.g. "eslint: ..."
			},
		})
		-- Enable the following language servers
		---@type table<string, vim.lsp.Config>
		local servers = {
			-- clangd = {},
			-- gopls = {},
			-- pyright = {},
			-- rust_analyzer = {},
			--
			-- Some languages (like typescript) have entire language plugins that can be useful:
			--    https://github.com/pmizio/typescript-tools.nvim
			--
			-- But for many setups, the LSP (`ts_ls`) will work just fine
			-- ts_ls = {},

			-- MarkDown LSP
			-- marksman = {},

			-- Java LSP
			jdtls = {},

			-- Python LSP
			basedpyright = {},

			-- Special Lua Config, as recommended by neovim help docs
			lua_ls = {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = { "lua/?.lua", "lua/?/init.lua" },
						},
						workspace = {
							checkThirdParty = false,
							-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
							--  See https://github.com/neovim/nvim-lspconfig/issues/3189
							library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
								"${3rd}/luv/library",
								"${3rd}/busted/library",
							}),
						},
					})
				end,
				settings = {
					Lua = {},
				},
			},
		}

		-- Ensure the servers and tools above are installed
		--
		-- To check the current status of installed tools and/or manually install
		-- other tools, you can run
		--    :Mason
		--
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- Add other tools here that you want Mason to install
			"stylua", -- Lua Formatter
			"prettierd", -- JavaScript & TypeScript Formatter
			"prettier", -- JavaScript & TypeScript Formatter
			"clang-format", -- Install for Java and Other C like Lang
			"java-debug-adapter",
			"java-test",
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		for name, server in pairs(servers) do
			if name ~= "jdtls" then
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end
		end

		-- local original_capabilities = vim.lsp.protocol.make_client_capabilities()
		-- local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)
	end,
}
