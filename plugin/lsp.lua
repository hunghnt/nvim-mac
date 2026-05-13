vim.pack.add({
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "clangd", "pyright" },
	handlers = {
		function(server_name)
			if server_name == "rust_analyzer" then
				require("lspconfig")[server_name].setup({
					commands = {
						ExpandMacro = {
							function()
								vim.lsp.buf_request_all(
									0,
									"rust-analyzer/expandMacro",
									vim.lsp.util.make_position_params(),
									function(result)
										vim.cmd("set splitright")
										vim.cmd("vsplit")

										local buf = vim.api.nvim_create_buf(false, true)

										vim.api.nvim_win_set_buf(0, buf)

										if result then
											vim.api.nvim_set_option_value("filetype", "rust", { buf = 0 })

											for client_id, res in pairs(result) do
												if res and res.result and res.result.expansion then
													vim.api.nvim_buf_set_lines(
														buf,
														-1,
														-1,
														false,
														vim.split(res.result.expansion, "\n")
													)
												else
													vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
														"No expansion available.",
													})
												end
											end
										else
											vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
												"Error: No result returned.",
											})
										end
									end
								)
							end,
						},
					},
				})
			else
				require("lspconfig")[server_name].setup({})
			end
		end,
	},
})

vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>le", "<Cmd>ExpandMacro<CR>", {})

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for cid, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
					vim.lsp.util.apply_workspace_edit(r.edit, enc)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})
