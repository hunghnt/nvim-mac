vim.pack.add({
	"https://github.com/akinsho/git-conflict.nvim",
})

require("git-conflict").setup({
	default_mappings = false,
	default_commands = true,
	disable_diagnostics = false,
	list_opener = "copen",
	highlights = {
		incoming = "DiffAdd",
		current = "DiffText",
	},
})

vim.keymap.set("n", "<leader>co", "<cmd>GitConflictChooseOurs<cr>", { desc = "Conflict: choose OURS" })
vim.keymap.set("n", "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Conflict: choose THEIRS" })
vim.keymap.set("n", "<leader>cb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Conflict: choose BOTH" })
vim.keymap.set("n", "<leader>c0", "<cmd>GitConflictChooseNone<cr>", { desc = "Conflict: choose NONE" })
vim.keymap.set("n", "<leader>cl", "<cmd>GitConflictListQf<cr>", { desc = "Conflict: list all in quickfix" })
vim.keymap.set("n", "]x", "<cmd>GitConflictNextConflict<cr>", { desc = "Next conflict" })
vim.keymap.set("n", "[x", "<cmd>GitConflictPrevConflict<cr>", { desc = "Previous conflict" })
