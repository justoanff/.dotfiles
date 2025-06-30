local keymap = vim.keymap

-- Exit insert mode
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sx", "<cmd>close<CR>")

-- Text manipulation
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "<C-a>", "gg<S-v>G")

-- File operations
keymap.set("n", "<C-s>", "<cmd>w<CR>")
keymap.set("n", "<leader>q", "<cmd>q<CR>")
keymap.set("n", "<leader>Q", "<cmd>qa!<CR>")

-- Navigation in insert mode
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-k>", "<Up>")
