vim.keymap.set("n", "<leader>gg", function()
	vim.pack.add({
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/kdheepak/lazygit.nvim",
	})
	vim.cmd("LazyGit")
end, { desc = "LazyGit" })
