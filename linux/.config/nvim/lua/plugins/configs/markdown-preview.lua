-- Markdown Preview configuration

-- Global options
vim.g.mkdp_theme = "dark"
vim.g.mkdp_auto_close = 1
vim.g.mkdp_preview_options = {
  disable_sync_scroll = 1, -- Disable sync scroll to avoid scroll issues in browser
  sync_scroll_type = 'middle',
  hide_yaml_meta = 1,
  toc = {},
}

-- Keymaps for convenience
local map = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "" }

map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", vim.tbl_extend("force", opts, { desc = "Markdown Preview Toggle" }))
map("n", "<leader>ms", "<cmd>MarkdownPreview<CR>",       vim.tbl_extend("force", opts, { desc = "Markdown Preview Start" }))
map("n", "<leader>mS", "<cmd>MarkdownPreviewStop<CR>",   vim.tbl_extend("force", opts, { desc = "Markdown Preview Stop" }))


