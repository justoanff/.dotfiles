local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Define autocommand groups
local yank_group = augroup('HighlightYank', { clear = true })
local cursor_group = augroup('RestoreCursor', { clear = true })
local format_group = augroup('FormatOnSave', { clear = true })
local terminal_group = augroup('TerminalSettings', { clear = true })
local resize_group = augroup('ResizeWindows', { clear = true })

-- Highlight text on yank
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200,
    })
  end,
})

-- Restore cursor position
autocmd('BufReadPost', {
  group = cursor_group,
  pattern = '*',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Format on save
-- Using conform.nvim to format on save
-- autocmd('BufWritePre', {
--   group = format_group,
--   pattern = '*',
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- Terminal settings
autocmd('TermOpen', {
  group = terminal_group,
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd('startinsert')
  end,
})

-- Auto-balance windows on resize
autocmd('VimResized', {
  group = resize_group,
  pattern = '*',
  command = 'wincmd =',
})

-- Auto save on insert leave or text change
autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*',
  command = 'silent! wall',
})

-- Remove trailing whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Create directories when saving if they don't exist
autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})
