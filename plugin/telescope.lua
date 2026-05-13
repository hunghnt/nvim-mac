vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{ src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.8" },
})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-l>"] = require("telescope.actions").select_default,
			},
		},
	},
	pickers = {
		find_files = {
			file_ignore_patterns = { "node_modules", ".git", ".venv", "target" },
			hidden = true,
		},
	},
	live_grep = {
		file_ignore_patterns = { "node_modules", ".git", ".venv", "target" },
		additional_args = function(_)
			return { "--hidden" }
		end,
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fF", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>fc", builtin.commands, {})
vim.keymap.set("n", "<leader>fy", builtin.registers, {})

vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "gI", builtin.lsp_implementations, {})
