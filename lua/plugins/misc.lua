return {
	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = { line = "<leader>gcc", block = "<leader>gbc" },
			opleader = { line = "<leader>gc", block = "<leader>gb" },
			extra = {
				above = "<leader>gcO",
				below = "<leader>gco",
				eol = "<leader>gcA",
			},
		},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {
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
		},
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"mg979/vim-visual-multi",
	},
}
