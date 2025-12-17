return {
	"wfxr/minimap.vim",
	init = function()
		vim.g.minimap_width = 10
		vim.g.minimap_auto_start = 1
		vim.g.minimap_auto_start_win_enter = 1

		vim.g.minimap_highlight_search = 1
		vim.g.minimap_git_colors = 1
	end,
	config = function()
		vim.keymap.set("n", "<leader>mm", ":MinimapToggle<CR>", { desc = "On/Off Minimap" })
		vim.keymap.set("n", "<leader>mc", ":MinimapClose<CR>", { desc = "Close Minimap" })
	end,
}
