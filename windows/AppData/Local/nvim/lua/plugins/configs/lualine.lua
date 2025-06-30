local custom_tokyonight = require 'lualine.themes.tokyonight'
custom_tokyonight.normal.c.bg = 'none'    -- Set normal background to transparent
require('lualine').setup {
  options = {
    icons_enabled = true,              -- Enable icons
    theme = custom_tokyonight,         -- Use customized theme
    globalstatus = true,               -- Use global statusline
  },
}