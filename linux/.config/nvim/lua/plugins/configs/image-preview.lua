-- image_preview.nvim configuration

require('image_preview').setup({})

-- Keymap: preview image under cursor (path on current line)
vim.keymap.set('n', '<leader>ip', function()
  -- Try to detect a path under cursor or use current file
  local line = vim.api.nvim_get_current_line()
  local path = line:match('%S+%.%a+$') or vim.fn.expand('%:p')
  if path and path ~= '' then
    require('image_preview').PreviewImage(path)
  else
    vim.notify('No image path found on this line', vim.log.levels.WARN)
  end
end, { desc = 'Image Preview: file under cursor' })


