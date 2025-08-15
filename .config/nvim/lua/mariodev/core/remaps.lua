local set = vim.keymap.set

-- vim.cmd runs vimscript in a lua file e.x vim.cmd(colorsheme blue)
set("n", "<leader>pv", vim.cmd.Ex)

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<leader>sv", "<C-w>v")
set("n", "<leader>sc", "<C-w>c")

set("n", "<leader>nh", "<cmd>nohl<cr>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("x", "<leader>p", "\"_dP")
set("i", "<C-c>", "<Esc>")

set("n", "<leader><leader>", "<cmd>so<cr>")
