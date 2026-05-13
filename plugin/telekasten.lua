vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
	"https://github.com/renerocksai/calendar-vim",
	"https://github.com/renerocksai/telekasten.nvim",
})

local home = vim.fn.expand("~/zettelkasten")
require("telekasten").setup({
	home = home,
	dailies = home .. "/daily",
	weeklies = home .. "/weekly",
	templates = home .. "/templates",
	template_new_note = home .. "/templates/new_note.md",
	template_new_daily = home .. "/templates/daily.md",
	template_new_weekly = home .. "/templates/weekly.md",
	extension = ".md",
	new_note_filename = "title-uuid",
	uuid_type = "%Y%m%d%H%M",
	uuid_sep = "-",
	follow_creates_nonexisting = true,
	dailies_create_nonexisting = true,
	weeklies_create_nonexisting = true,
	auto_set_filetype = true,
	journal_auto_open = false,
	image_subdir = "img",
	command_palette_theme = "dropdown",
	show_tags_theme = "ivy",
	plug_into_calendar = true,
	calendar_opts = {
		weeknm = 4,
		calendar_monday = 1,
		calendar_mark = "left-fit",
	},
})

vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten panel<CR>", { desc = "Telekasten panel" })
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { desc = "Daily note (today)" })
vim.keymap.set("n", "<leader>zw", "<cmd>Telekasten goto_thisweek<CR>", { desc = "Weekly note" })
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "New note" })
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "Find notes" })
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { desc = "Grep notes" })
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>", { desc = "Show tags" })
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { desc = "Show backlinks" })
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "Calendar" })
vim.keymap.set("n", "<leader>zi", "<cmd>Telekasten insert_link<CR>", { desc = "Insert link" })
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", { desc = "Insert image link" })
vim.keymap.set("n", "<leader>zo", "<cmd>Telekasten follow_link<CR>", { desc = "Follow link" })
vim.keymap.set("n", "<leader>zr", "<cmd>Telekasten rename_note<CR>", { desc = "Rename note" })
