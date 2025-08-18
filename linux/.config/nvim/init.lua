-- nvim/lua/core/init.lua
require("core.globals")   -- Load global variables
require("core.options")   -- Load editor options
require("core.keymaps")   -- Load key mappings
require("core.autocmds")  -- Load autocommands

-- Load plugins
require('plugins')        -- Load plugin configuration
