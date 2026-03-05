require("options")

-- Lazy set up
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)
-- Setup
require("lazy").setup({
	require("plugins.misc"),
	require("plugins.colortheme"),
	require("plugins.gitsigns"),
	require("plugins.treesitter"),
	require("plugins.lsp"),
	require("plugins.nonels"),
	require("plugins.cmp"),
	require("plugins.telescope"),
	require("plugins.oil"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.lazygit"),
	require("plugins.indent-blankline"),
	require("plugins.debug"),
	require("plugins.lspsaga"),
	require("plugins.gitblame"),
	require("plugins.ai"),
	require("plugins.vim-visual-multi"),
	require("plugins.wrapperd"),
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
})

-- Lua

vim.cmd("colorscheme poimandres")

vim.api.nvim_set_hl(0, "@keyword.return.go", { fg = "#ff3333" })
-- vim.api.nvim_set_hl(0, "@constant.go", { fg = "#4EC9B0" })
-- vim.api.nvim_set_hl(0, "@variable.go", { fg = "#faf5f5" })
-- vim.api.nvim_set_hl(0, "@string.go", { fg = "#faf16e" })
-- vim.api.nvim_set_hl(0, "@number.go", { fg = "#B5CEA8" })
-- vim.api.nvim_set_hl(0, "@boolean.go", { fg = "#B5CEA8" })
-- vim.api.nvim_set_hl(0, "@type.go", { fg = "#91fc7e" })
-- vim.api.nvim_set_hl(0, "@property.go", { fg = "#75ffff" })
--
--
vim.api.nvim_set_hl(0, "@function", { fg = "#00ff00" })

-- Function names when they're called
vim.api.nvim_set_hl(0, "@function.call", { fg = "#00ff00" })

-- -- Built-in functions (like make, len, append)
-- vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#ffaa00" })
--
-- -- Method definitions
-- vim.api.nvim_set_hl(0, "@function.method", { fg = "#00ffaa" })
--
-- -- Method calls
-- vim.api.nvim_set_hl(0, "@function.method.call", { fg = "#00ffaa" })
--
-- -- The "func" keyword itself
-- vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#ff6666" })

vim.api.nvim_create_user_command("Vterm", function()
	local total_cols = vim.o.columns
	local code_width = 200

	-- Nếu màn hình nhỏ hơn 250 cột, hãy chia tỉ lệ 70/30 thay vì cố định 200
	if total_cols < 250 then
		code_width = math.floor(total_cols * 0.7)
	end

	vim.cmd("rightbelow vnew | term")
	local term_win = vim.api.nvim_get_current_win()

	-- Nhảy về cửa sổ cũ để resize
	vim.cmd("wincmd p")
	vim.cmd("vertical resize " .. code_width)

	-- Quay lại terminal
	vim.api.nvim_set_current_win(term_win)

	vim.cmd("startinsert")
end, {})

-- Set the background to a specific Hex color (e.g., a deep charcoal)
local function set_black_background()
	-- Main Editor Background
	local groups = {
		"Normal",
		"NormalFloat",
		"SignColumn",
		"LineNr",
		"FoldColumn",
		"CursorLine",
		"EndOfBuffer",
	}
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "#000000" })
	end

	-- Telescope Specific Windows
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
end

-- Run it now
set_black_background()

-- Run it every time a colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_black_background,
})
