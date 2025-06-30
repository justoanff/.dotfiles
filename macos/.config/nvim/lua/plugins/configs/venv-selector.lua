require("venv-selector").setup({
  -- Name of the virtual environment
  name = {"venv", ".venv"},
  -- Automatically refresh the list of virtual environments
  auto_refresh = true,
  -- Support dap-python (debugging)
  dap_enabled = true,
  
  -- The directories containing environments
  parents = 0,
  path = vim.fn.stdpath("data") .. "/venvs",
  
  -- UI options
  notify_user_on_activate = true,
})

-- Set up keymappings for venv-selector
vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Python virtual environment" })
vim.keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Select cached Python virtual environment" })