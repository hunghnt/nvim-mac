vim.pack.add({
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/mbbill/undotree",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-sleuth",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/mg979/vim-visual-multi",
})

require("Comment").setup({})
require("fidget").setup({})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/windwp/nvim-autopairs" })
		require("nvim-autopairs").setup({
			check_ts = true,
			ts_config = { java = false },
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = ([[ [%'%"%)%>%]%)%}%,] ]]):gsub("%s+", ""),
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		})
	end,
})
