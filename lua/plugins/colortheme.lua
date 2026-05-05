return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				undercurl = true,
				commentStyle = { italic = true },
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				transparent = false,
				theme = "wave",
				background = { dark = "wave", light = "lotus" },
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				transparent_background = true,
			})
		end,
		init = function()
			vim.cmd("colorscheme poimandres")
		end,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = { "nord", "kanagawa", "catppuccin", "rose-pine", "poimandres" },
				livePreview = true,
				transparent = true,
			})

			-- Transparent background overrides (Go syntax overrides disabled — using native palette)
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
		end,
	},
}
