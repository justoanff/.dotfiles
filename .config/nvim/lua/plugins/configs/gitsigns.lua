require('gitsigns').setup({
  signs = {
    add          = { text = '┃' },   -- Sign for added lines
    change       = { text = '┃' },   -- Sign for changed lines
    delete       = { text = '_' },   -- Sign for deleted lines
    topdelete    = { text = '‾' },   -- Sign for top deletion
    changedelete = { text = '~' },   -- Sign for changed then deleted
    untracked    = { text = '┆' },   -- Sign for untracked files
  },
  signs_staged = {
    add          = { text = '┃' },   -- Staged added lines
    change       = { text = '┃' },   -- Staged changed lines
    delete       = { text = '_' },   -- Staged deleted lines
    topdelete    = { text = '‾' },   -- Staged top deletion
    changedelete = { text = '~' },   -- Staged change-delete
    untracked    = { text = '┆' },   -- Staged untracked
  },
  signs_staged_enable = true,        -- Enable signs for staged changes
  signcolumn = true,                 -- Show in sign column
  numhl = false,                     -- No line number highlight
  linehl = false,                    -- No line highlight
  word_diff = false,                 -- No word diff highlighting
  watch_gitdir = {
    follow_files = true              -- Follow file renames
  },
  auto_attach = true,                -- Auto attach to buffers
  attach_to_untracked = false,       -- Don't attach to untracked files
  current_line_blame = false,        -- Disable inline blame
  current_line_blame_opts = {
    virt_text = true,                -- Show as virtual text
    virt_text_pos = 'eol',           -- Position at end of line
    delay = 1000,                    -- 1 second delay
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,                
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,                 -- Sign priority
  update_debounce = 100,             -- Update delay in ms
  max_file_length = 40000,           -- Max lines before disabling
  preview_config = {
    border = 'single',               -- Preview window border
    style = 'minimal',               -- Minimal style
    relative = 'cursor',             -- Position relative to cursor
    row = 0,                         
    col = 1
  },
})