return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "DiffviewOpen", "DiffviewFileHistory" }, -- Lazy loads when you use these commands
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File History (Current File)" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: Project History" },
	},
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			keymaps = {
				view = {
					-- Keymap to close Diffview easily while inside the diff
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
					{ "n", "<leader>e", actions.toggle_files, { desc = "Toggle file panel" } },
				},
				file_panel = {
					{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } },
				},
			},
		})
	end,
}
