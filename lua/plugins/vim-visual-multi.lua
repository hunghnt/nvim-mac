return {
	"mg979/vim-visual-multi",
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<C-d>",
			["Find Subword Under"] = "<C-d>",
			["Select All"] = "<C-S-l>",
			["Add Cursor Down"] = "<M-C-Down>",
			["Add Cursor Up"] = "<M-C-Up>",
		}
	end,
}
