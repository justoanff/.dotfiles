-- Basic Settings
local opt = vim.opt
opt.shortmess:append('I')      -- Hide intro message
opt.number = true              -- Show line numbers
opt.relativenumber = true      -- Show relative line numbers
opt.termguicolors = true       -- True color support
opt.wrap = true                -- Wrap long lines
opt.breakindent = true         -- Preserve indent when wrapping
opt.cmdheight = 0              -- Hide command line when not used
opt.showmode = false           -- Hide mode indicator
opt.laststatus = 3             -- Global statusline
opt.signcolumn = "yes"         -- Always show sign column
opt.cursorline = true          -- Highlight current line
opt.scrolloff = 8              -- Lines above/below cursor
opt.sidescrolloff = 8          -- Columns left/right of cursor
opt.splitbelow = true          -- Horizontal splits below
opt.splitright = true          -- Vertical splits to the right
opt.pumheight = 10             -- Max items in popup menu
opt.conceallevel = 0           -- Show concealed text
opt.list = true                -- Show hidden characters
opt.listchars = {
  tab = '→ ',
  trail = '·',
  extends = '⟩',
  precedes = '⟨',
  nbsp = '␣'
}                              -- Hidden character config

-- Editing
opt.expandtab = true           -- Use spaces instead of tabs
opt.tabstop = 2                -- Tab width
opt.shiftwidth = 2             -- Indent width
opt.smartindent = true         -- Smart indenting
opt.autoindent = true          -- Keep indent when line break
opt.preserveindent = true      -- Preserve indent structure
opt.textwidth = 80             -- Max text width
opt.colorcolumn = "80"         -- Show width marker
opt.formatoptions = "jcroqlnt" -- Format options

-- Search
opt.ignorecase = true          -- Case insensitive search
opt.smartcase = true           -- Smart case sensitivity
opt.hlsearch = false           -- Don't highlight matches
opt.incsearch = true           -- Search as you type
opt.grepprg = "rg --vimgrep"   -- Use ripgrep
opt.grepformat = "%f:%l:%c:%m" -- Grep output format

-- Performance
opt.hidden = true              -- Enable hidden buffers
opt.history = 100              -- Command history
opt.updatetime = 250           -- Faster updates
opt.timeoutlen = 300           -- Mapping timeout
opt.redrawtime = 1500          -- Max redraw time
opt.synmaxcol = 240            -- Max column for syntax

-- Backup and Undo
opt.backup = false             -- No backup files
opt.writebackup = false        -- No backup when writing
opt.undofile = true            -- Persistent undo
opt.swapfile = false           -- No swap files

-- Completion
opt.completeopt = "menu,menuone,noselect"      -- Completion options
opt.wildmode = "longest:full,full"             -- Command completion mode
opt.wildignore = "*/node_modules/*,*.swp,.git" -- Ignore patterns

-- Mouse and Clipboard
opt.mouse = 'a'                -- Enable mouse
opt.clipboard = 'unnamedplus'  -- Use system clipboard
opt.mousemoveevent = true      -- Enable mouse move events

-- Folding
opt.foldmethod = "indent"      -- Fold by indent
opt.foldlevel = 99             -- Open all folds
opt.foldlevelstart = 99        -- Start with all folds open