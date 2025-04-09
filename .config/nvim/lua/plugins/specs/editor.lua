return {
  {
    "folke/which-key.nvim",          -- Which-Key plugin for keybinding help
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Icons for UI
      "echasnovski/mini.icons"       -- Additional icons
    },
    event = "VeryLazy",              -- Load on VeryLazy event
    init = function()
      vim.o.timeout = true           -- Enable timeout
      vim.o.timeoutlen = 300         -- Set timeout length
    end,
    config = function()
      require("plugins.configs.whichkey")
    end,
  },
}