local conform = require("conform")
local mason_registry = require("mason-registry")

-- Ensure all required formatters are installed
local ensure_installed = { "stylua", "prettier", "black", "isort", "shfmt" }
for _, formatter in ipairs(ensure_installed) do
  if not mason_registry.is_installed(formatter) then
    vim.cmd("MasonInstall " .. formatter)
  end
end

conform.setup({
  -- Define formatters
  formatters_by_ft = {
    lua = { "stylua" },
    -- Web development
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    -- Python
    python = { "isort", "black" },
    -- Shell
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },

  -- Format on save
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- Set up format-on-save autocmd
  format_after_save = {
    lsp_fallback = true,
  },

  -- Customize formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2", "-ci" },
    },
  },
})

-- Set up key mappings
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" }) 