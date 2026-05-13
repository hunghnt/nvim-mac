vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvimtools/none-ls-extras.nvim",
	"https://github.com/jayp0521/mason-null-ls.nvim",
	"https://github.com/nvimtools/none-ls.nvim",
})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("mason-null-ls").setup({
	ensure_installed = {
		"prettier",
		"stylua",
	},
	automatic_installation = true,
})

local sources = {
	formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),
	formatting.stylua,
	require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
	require("none-ls.formatting.ruff_format"),
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
