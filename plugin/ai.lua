vim.pack.add({
	"https://github.com/zbirenbaum/copilot.lua",
})

require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		hide_during_completion = true,
		debounce = 100,
		trigger_on_accept = true,
		keymap = {
			accept = "<C-a>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-Tab>",
		},
	},
})
