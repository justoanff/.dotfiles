-- Bufferline Configuration
local bufferline = require("bufferline")

-- Keymaps for bufferline
local function setup_keymaps()
  -- Buffer navigation
  vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
  vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

  -- Buffer operations
  vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
  vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
  vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
  vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
  vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
  vim.keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

  -- Buffer sorting
  vim.keymap.set("n", "<leader>be", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort by extension" })
  vim.keymap.set("n", "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort by directory" })

  -- Quick buffer switching
  vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Buffer 1" })
  vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Buffer 2" })
  vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Buffer 3" })
  vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Buffer 4" })
  vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Buffer 5" })
  vim.keymap.set("n", "<leader>$", "<cmd>BufferLineGoToBuffer -1<CR>", { desc = "Last buffer" })
end

-- Setup bufferline
bufferline.setup({
  options = {
    -- Filter empty buffers
    custom_filter = function(buf_number, buf_numbers)
      -- Filter out empty buffers
      local buffer_name = vim.fn.bufname(buf_number)
      if buffer_name == "" or buffer_name == "[No Name]" then
        return false
      end
      return true
    end,

    -- Hide empty buffers at startup
    show_buffer_default = false,

    -- Additional configuration
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      }
    },
  }
})

-- Apply keymaps
setup_keymaps()