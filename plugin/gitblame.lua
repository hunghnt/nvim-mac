vim.schedule(function()
	vim.pack.add({ "https://github.com/f-person/git-blame.nvim" })

	require("gitblame").setup({
		enabled = true,
		message_template = " <summary> • <date> • <author> • <<sha>>",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text_column = 1,
		delay = 1000,
	})
end)
