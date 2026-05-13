vim.pack.add({
	"https://github.com/catppuccin/nvim",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/rose-pine/neovim",
	"https://github.com/olivercederborg/poimandres.nvim",
	"https://github.com/shaunsingh/nord.nvim",
	"https://github.com/zaldih/themery.nvim",
})

require("kanagawa").setup({
	undercurl = true,
	commentStyle = { italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	transparent = false,
	theme = "wave",
	background = { dark = "wave", light = "lotus" },
})

require("poimandres").setup({
	transparent_background = true,
})

vim.cmd("colorscheme poimandres")

require("themery").setup({
	themes = { "nord", "kanagawa", "catppuccin", "rose-pine", "poimandres" },
	livePreview = true,
	transparent = true,
})

local function apply_custom_highlights()
	local bg_groups = {
		"Normal",
		"NormalFloat",
		"SignColumn",
		"LineNr",
		"FoldColumn",
		"CursorLine",
		"EndOfBuffer",
	}
	for _, group in ipairs(bg_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE" })
	end

	-- Go-specific Syntax overrides disabled
	-- vim.api.nvim_set_hl(0, "@keyword.return.go", { fg = "#d4a5a5" })
	-- vim.api.nvim_set_hl(0, "@function", { fg = "#a5b8d4" })
	-- vim.api.nvim_set_hl(0, "@function.call", { fg = "#a5b8d4" })
	-- vim.api.nvim_set_hl(0, "@string", { fg = "#a8c4a8" })
	-- vim.api.nvim_set_hl(0, "@keyword", { fg = "#bca5d4" })
	-- vim.api.nvim_set_hl(0, "@variable", { fg = "#d4c8a5" })
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = apply_custom_highlights,
})
