vim.pack.add({ "https://github.com/nvimdev/lspsaga.nvim" })

require("lspsaga").setup({
	symbol_in_winbar = {
		enable = true,
		separator = "  ",
		show_file = true,
		folder_level = 2,
	},
	lightbulb = {
		enable = false,
	},
})
