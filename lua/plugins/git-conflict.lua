return {
	"akinsho/git-conflict.nvim",
	version = "*",
	event = "BufReadPre",
	opts = {
		default_mappings = false,
		default_commands = true,
		disable_diagnostics = false,
		list_opener = "copen",
		highlights = {
			incoming = "DiffAdd",
			current = "DiffText",
		},
	},
	keys = {
		{ "<leader>co", "<cmd>GitConflictChooseOurs<cr>",   desc = "Conflict: choose OURS" },
		{ "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Conflict: choose THEIRS" },
		{ "<leader>cb", "<cmd>GitConflictChooseBoth<cr>",   desc = "Conflict: choose BOTH" },
		{ "<leader>c0", "<cmd>GitConflictChooseNone<cr>",   desc = "Conflict: choose NONE" },
		{ "<leader>cl", "<cmd>GitConflictListQf<cr>",       desc = "Conflict: list all in quickfix" },
		{ "]x",         "<cmd>GitConflictNextConflict<cr>", desc = "Next conflict" },
		{ "[x",         "<cmd>GitConflictPrevConflict<cr>", desc = "Previous conflict" },
	},
}
