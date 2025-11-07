vim.g.mapleader = " " -- Space as leader key
vim.g.maplocalleader = " " -- Space as local leader key (optional)im.cmd("set expandtab")

vim.wo.number = true

vim.o.relativenumber = true
vim.o.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.breakindent = true

vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.laststatus = 3

-- general keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Buffers
vim.keymap.set("n", "<tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<s-tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
