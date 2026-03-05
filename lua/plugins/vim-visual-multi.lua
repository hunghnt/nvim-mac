return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<C-1>",
			["Find Subword Under"] = "<C-1>",
			["Select All"] = "<C-S-l>",
			["Add Cursor Down"] = "<M-C-Down>",
			["Add Cursor Up"] = "<M-C-Up>",
		}
	end,
}
