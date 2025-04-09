local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,               -- Previous item
                ["<C-j>"] = actions.move_selection_next,                   -- Next item
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to quickfix
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown", -- Dropdown appearance
            hijack_netrw = true, -- Replace netrw
        },
    },
})

-- Load extensions
telescope.load_extension("file_browser") -- Load file browser extension

-- Keymaps
local keymap = vim.keymap
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")   -- Find files
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")    -- Search text
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")  -- Search current word
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")      -- List buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")    -- Search help
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<cr>") -- File browser
