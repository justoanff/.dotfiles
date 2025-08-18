require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "lua",              -- Lua parser
    "vim",              -- Vim parser
    "vimdoc",           -- Vim help docs parser
    "javascript",       -- JavaScript parser
    "typescript",       -- TypeScript parser
    "python",           -- Python parser
    "markdown",         -- Markdown parser
    "markdown_inline",  -- Inline markdown parser
    "regex",            -- Regex parser
    "bash",             -- Bash parser
  },

  highlight = {
    enable = true,      -- Enable syntax highlighting
  },

  indent = {
    enable = true,      -- Enable indentation
  },

  autotag = {
    enable = true,      -- Auto close HTML/XML tags
  },
})

-- Automatically update Treesitter queries after 1 second
-- vim.defer_fn(function()
--   pcall(vim.cmd, "TSUpdate query")
-- end, 1000)