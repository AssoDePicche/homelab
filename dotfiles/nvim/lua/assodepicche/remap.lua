vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "th", ":split<CR>")
vim.keymap.set("n", "tv", ":vsplit<CR>")
vim.keymap.set("n", "<C-i>", ":nohlsearch<CR>")
vim.keymap.set("n", "q", ":q<CR>")
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-e>", ":e ")
vim.keymap.set("n", "<C-f>", ":%s/")
vim.keymap.set("n", "<C-t>", ":term<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("", "<C-h>", "<C-w>h")
vim.keymap.set("", "<C-j>", "<C-w>j")
vim.keymap.set("", "<C-l>", "<C-w>l")
vim.keymap.set("", "<C-k>", "<C-w>k")
