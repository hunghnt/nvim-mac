return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3b3b" })
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#7aa2f7" })
		end)
		require("ibl").setup({
		indent = {
			char = "▏",
		},
		scope = {
			show_start = false,
			show_end = false,
			show_exact_scope = false,
		},
		exclude = {
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
			},
		},
	})
	end,
}
