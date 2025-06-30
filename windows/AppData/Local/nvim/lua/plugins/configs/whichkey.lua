local wk = require("which-key")

-- Setup which-key with options
wk.setup({
  -- Empty options for now
})

-- Define key mappings
local function setup_keymaps()
  -- Show all keymaps
  vim.keymap.set("n", "<leader>?", function()
    wk.show({ mode = "n", auto = true })
  end, { desc = "Show All Keymaps" })

  -- Show leader keymaps
  vim.keymap.set("n", "<leader>/", function()
    wk.show({ mode = "n", prefix = "<leader>" })
  end, { desc = "Show Leader Keymaps" })

  -- Register additional mappings
  wk.add({
    -- Buffer navigation
    { "<Tab>",      "<cmd>BufferLineCycleNext<CR>",       desc = "Next buffer" },         -- Go to next buffer
    { "<S-Tab>",    "<cmd>BufferLineCyclePrev<CR>",       desc = "Previous buffer" },     -- Go to previous buffer

    -- Buffer group
    { "<leader>b",  group = "Buffer" },                                                  -- Buffer commands group
    { "<leader>bc", "<cmd>BufferLinePickClose<CR>",       desc = "Pick buffer to close" }, -- Close specific buffer
    { "<leader>bp", "<cmd>BufferLinePick<CR>",            desc = "Pick buffer" },          -- Select buffer
    { "<leader>br", "<cmd>BufferLineCloseRight<CR>",      desc = "Close buffers to the right" }, -- Close right buffers
    { "<leader>bl", "<cmd>BufferLineCloseLeft<CR>",       desc = "Close buffers to the left" },  -- Close left buffers
    { "<leader>bo", "<cmd>BufferLineCloseOthers<CR>",     desc = "Close other buffers" },   -- Close other buffers
    { "<leader>bx", "<cmd>bdelete<CR>",                   desc = "Close current buffer" },   -- Close current buffer
    { "<leader>be", "<cmd>BufferLineSortByExtension<CR>", desc = "Sort by extension" },     -- Sort by extension
    { "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", desc = "Sort by directory" },     -- Sort by directory

    -- Quick buffer switching
    { "<leader>1",  "<cmd>BufferLineGoToBuffer 1<CR>",    desc = "Buffer 1" },  -- Go to buffer 1
    { "<leader>2",  "<cmd>BufferLineGoToBuffer 2<CR>",    desc = "Buffer 2" },  -- Go to buffer 2
    { "<leader>3",  "<cmd>BufferLineGoToBuffer 3<CR>",    desc = "Buffer 3" },  -- Go to buffer 3
    { "<leader>4",  "<cmd>BufferLineGoToBuffer 4<CR>",    desc = "Buffer 4" },  -- Go to buffer 4
    { "<leader>5",  "<cmd>BufferLineGoToBuffer 5<CR>",    desc = "Buffer 5" },  -- Go to buffer 5
    { "<leader>$",  "<cmd>BufferLineGoToBuffer -1<CR>",   desc = "Last buffer" },  -- Go to last buffer

    -- File operations
    { "<leader>f",  group = "Telescope" },                               -- Telescope group
    { "<leader>ff", "<cmd>Telescope find_files<CR>",      desc = "Find file" },    -- Find files
    { "<leader>fs", "<cmd>Telescope live_grep<CR>",       desc = "Live grep" },    -- Search in files
    { "<leader>fc", "<cmd>Telescope grep_string<CR>",     desc = "Grep string" },  -- Search current word
    { "<leader>fb", "<cmd>Telescope buffers<CR>",         desc = "Buffers" },      -- List buffers
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",       desc = "Help tags" },    -- Search help
    { "<leader>fe", "<cmd>Telescope file_browser<CR>",    desc = "Files browser" },-- Browse files

    -- Window split
    { "<leader>s",  group = "Window split" },  -- Window operations group
  })
end

-- Apply keymaps
setup_keymaps()