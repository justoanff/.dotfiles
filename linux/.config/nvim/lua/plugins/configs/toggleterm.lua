-- Terminal Configuration

local toggleterm = require("toggleterm")

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  persist_size = true,
  persist_mode = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  auto_scroll = true,
  float_opts = {
    border = "curved",
    winblend = 0,
  },
})

-- Convenience keymaps (match pattern used in tools.lua before refactor)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", opts)
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", opts)
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)

-- Terminal window mappings
vim.cmd([[
  autocmd! TermOpen term://* lua set_terminal_keymaps()
]])

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- Create a custom terminal for lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  on_close = function(_)
    vim.cmd("startinsert!")
  end,
})

function _G.toggle_lazygit()
  lazygit:toggle()
end

-- Setup mapping for lazygit
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua toggle_lazygit()<CR>", {noremap = true, silent = true}) 