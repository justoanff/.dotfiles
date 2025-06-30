local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)  -- Add lazy.nvim to runtime path

-- Load all plugins
require("lazy").setup({
  spec = {
    { import = "plugins.specs.ui" },      -- UI plugins
    { import = "plugins.specs.editor" },  -- Editor plugins
    { import = "plugins.specs.coding" },  -- Coding plugins
    { import = "plugins.specs.tools" },   -- Tools plugins
  },
  defaults = {
    lazy = false,    -- Load plugins at startup
    version = false, -- Use latest version
  },
  install = {
    colorscheme = { "catppuccin" },  -- Default colorscheme
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",         -- Disable built-in gzip
        "matchit",      -- Disable built-in matchit
        "matchparen",   -- Disable built-in matchparen
        "netrwPlugin",  -- Disable built-in file explorer
        "tarPlugin",    -- Disable built-in tar plugin
        "tohtml",       -- Disable built-in tohtml
        "tutor",        -- Disable built-in tutor
        "zipPlugin",    -- Disable built-in zip plugin
      },
    },
  },
  rocks = {
    enabled = false,  -- Disable luarocks completely
  },
  change_detection = {
    notify = false,  -- Don't notify on changes
  },
})