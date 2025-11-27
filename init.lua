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
vim.api.nvim_set_hl(0, "@keyword.return.go", { fg = "#ff3333" }) -- purple for return
vim.api.nvim_set_hl(0, "@constant.go", { fg = "#4EC9B0" }) -- green for values/constants
vim.api.nvim_set_hl(0, "@variable.go", { fg = "#faf5f5" }) -- light blue for variables
vim.api.nvim_set_hl(0, "@string.go", { fg = "#faf16e" }) -- orange for strings
vim.api.nvim_set_hl(0, "@number.go", { fg = "#B5CEA8" }) -- green for numbers
vim.api.nvim_set_hl(0, "@boolean.go", { fg = "#B5CEA8" }) -- green for true/false/nil
vim.api.nvim_set_hl(0, "@type.go", { fg = "#91fc7e" })

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
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
})
