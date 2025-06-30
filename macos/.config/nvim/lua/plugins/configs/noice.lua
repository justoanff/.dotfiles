require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,  -- Use Treesitter for markdown
      ["vim.lsp.util.stylize_markdown"] = true,                 -- Override markdown styling
      ["cmp.entry.get_documentation"] = true,                   -- Override cmp docs
    },
  },
  presets = {
    bottom_search = true,         -- Classic bottom search
    command_palette = true,       -- Combined cmdline and popup
    long_message_to_split = true, -- Send long messages to split
    inc_rename = false,           -- No rename dialog
    lsp_doc_border = false,       -- No border for docs
  },
})