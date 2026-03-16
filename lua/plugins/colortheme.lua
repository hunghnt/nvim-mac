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
			require("poimandres").setup({})
		end,
		init = function()
			vim.cmd("colorscheme poimandres")
		end,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = { "kanagawa", "catppuccin", "rose-pine", "poimandres" },
				livePreview = true,
				transparent = true,
			})

			-- Centralized logic for Black Background and Go Highlighting
			local function apply_custom_highlights()
				-- 1. Deep Black Background
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
					vim.api.nvim_set_hl(0, group, { bg = "#000000" })
				end

				-- 2. Telescope Styling
				local telescope_groups = {
					"TelescopeNormal",
					"TelescopeBorder",
					"TelescopePromptNormal",
					"TelescopePromptBorder",
					"TelescopeResultsNormal",
					"TelescopeResultsBorder",
					"TelescopePreviewNormal",
					"TelescopePreviewBorder",
				}
				for _, group in ipairs(telescope_groups) do
					vim.api.nvim_set_hl(0, group, { bg = "#000000" })
				end

				-- 3. Go-specific Syntax (Professional Green/Red Palette)
				vim.api.nvim_set_hl(0, "@keyword.return.go", { fg = "#ff3333" })
				vim.api.nvim_set_hl(0, "@function", { fg = "#00ff00" })
				vim.api.nvim_set_hl(0, "@function.call", { fg = "#00ff00" })
			end

			-- Initial run
			apply_custom_highlights()

			-- Re-apply whenever you change themes via Themery or :colorscheme
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = apply_custom_highlights,
			})
		end,
	},
}
