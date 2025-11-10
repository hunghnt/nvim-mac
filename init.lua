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
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
})
