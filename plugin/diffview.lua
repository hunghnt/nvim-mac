vim.pack.add({
	"https://github.com/sindrets/diffview.nvim",
})

local actions = require("diffview.actions")

require("diffview").setup({
	enhanced_diff_hl = true,
	view = {
		merge_tool = {
			layout = "diff3_mixed",
			disable_diagnostics = true,
			winbar_info = true,
		},
	},
	keymaps = {
		view = {
			{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
			{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle file panel" } },
			{ "n", "]x", actions.next_conflict, { desc = "Next conflict" } },
			{ "n", "[x", actions.prev_conflict, { desc = "Previous conflict" } },
			{ "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose OURS" } },
			{ "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose THEIRS" } },
			{ "n", "<leader>cb", actions.conflict_choose("all"), { desc = "Choose BOTH" } },
			{ "n", "<leader>c0", actions.conflict_choose("none"), { desc = "Choose NONE" } },
			{ "n", "<leader>cO", actions.conflict_choose_all("ours"), { desc = "Choose OURS for whole file" } },
			{ "n", "<leader>cT", actions.conflict_choose_all("theirs"), { desc = "Choose THEIRS for whole file" } },
			{ "n", "<leader>cB", actions.conflict_choose_all("all"), { desc = "Choose BOTH for whole file" } },
		},
		file_panel = {
			{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
			{ "n", "j", actions.next_entry, { desc = "Next file" } },
			{ "n", "k", actions.prev_entry, { desc = "Prev file" } },
		},
	},
})

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview: open" })
vim.keymap.set("n", "<leader>gm", "<cmd>DiffviewOpen<cr>", { desc = "Merge tool (conflicts)" })
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>", { desc = "Diffview: close" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Diffview: file history (current)" })
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "Diffview: project history" })
