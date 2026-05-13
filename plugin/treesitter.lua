vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"vimdoc",
		"vim",
		"regex",
		"sql",
		"dockerfile",
		"toml",
		"json",
		"go",
		"gitignore",
		"yaml",
		"make",
		"cmake",
		"markdown",
		"markdown_inline",
		"bash",
		"tsx",
		"css",
		"html",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = { enable = true },
})
