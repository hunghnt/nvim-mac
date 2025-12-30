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
	-- require("plugins.minimap"),
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
-- vim.api.nvim_set_hl(0, "@property.go", { fg = "#fcb6ee" })
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
