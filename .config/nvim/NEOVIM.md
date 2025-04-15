# Modern Neovim Configuration

A modular, maintainable, and extensible Neovim configuration designed to enhance productivity while remaining easy to customize.

## Table of Contents

- [Structure Overview](#structure-overview)
- [Core Configuration](#core-configuration)
- [Plugin System](#plugin-system)
- [Featured Plugins](#featured-plugins)
- [How It Works](#how-it-works)
- [How to Add New Plugins](#how-to-add-new-plugins)
- [Customizing Existing Plugins](#customizing-existing-plugins)
- [Key Bindings](#key-bindings)
- [Troubleshooting](#troubleshooting)

## Structure Overview

This configuration follows a modular structure organized as follows:

```md
.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── core/                # Core Neovim settings
│   │   ├── autocmds.lua     # Automatic commands
│   │   ├── keymaps.lua      # Basic key mappings
│   │   └── options.lua      # Neovim options and settings
│   │
│   └── plugins/             # Plugin management
│       ├── init.lua         # Plugin loader using lazy.nvim
│       ├── configs/         # Individual plugin configurations
│       │   ├── avante.lua         # AI assistant configuration
│       │   ├── bufferline.lua     # Buffer line configuration
│       │   ├── colorscheme.lua    # Theme configuration
│       │   ├── conform.lua        # Formatter configuration
│       │   ├── lsp.lua            # LSP configuration
│       │   ├── venv-selector.lua  # Python virtual env manager
│       │   └── ...                # Other plugin configurations
│       │
│       └── specs/           # Plugin specifications by category
│           ├── ui.lua       # User interface plugins
│           ├── editor.lua   # Editor enhancement plugins
│           ├── coding.lua   # Programming/LSP plugins
│           └── tools.lua    # Utility plugins
```

## Core Configuration

The core configuration establishes the foundation of the Neovim experience:

- **options.lua**: Sets editor behavior like line numbers, indentation, and UI elements
- **keymaps.lua**: Defines basic key mappings that work without plugins
- **autocmds.lua**: Sets up automatic commands for various events

## Plugin System

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management, organized by functionality:

- **UI**: Visual enhancements like themes, status line, and buffer line
- **Editor**: Core editing capabilities like which-key
- **Coding**: Language support via Treesitter, LSP, and completion
- **Tools**: Utilities like file explorer, telescope, and git integration

## Featured Plugins

This configuration includes several powerful plugins:

### UI & Appearance

- **Tokyo Night**: Modern dark theme with clean aesthetics
- **Lualine**: Customizable statusline
- **Bufferline**: Enhanced buffer line with tabs
- **Noice**: Enhanced UI for notifications and cmdline

### Editing & Navigation

- **Which Key**: Interactive keybinding display
- **Nvim Surround**: Work with surroundings (brackets, quotes, etc.)
- **Telescope**: Fuzzy finder for files, buffers, and more
- **Neo-tree**: File explorer with icon support

### Development & Coding

- **LSP Zero**: Simplified LSP configuration
- **Treesitter**: Syntax highlighting and code navigation
- **Mason**: Package manager for LSP servers
- **Conform**: Formatter integration
- **Venv Selector**: Python virtual environment management

### Tools & Extensions

- **Avante**: AI assistant for development
- **Gitsigns**: Git integration in the editor
- **Tmux Navigator**: Seamless navigation between tmux panes and Neovim

## How It Works

The configuration loads in this sequence:

1. **init.lua** loads core modules and the plugin system
2. **plugins/init.lua** initializes lazy.nvim and loads plugin specifications
3. **plugins/specs/*.lua** define which plugins to install and how to configure them
4. **plugins/configs/*.lua** contain the detailed configuration for each plugin

This modular approach keeps the configuration organized and makes it easy to add, remove, or modify components.

## How to Add New Plugins

To add a new plugin:

1. **Identify the category**: Determine if your plugin is UI, editor, coding, or tools related

2. **Add the plugin specification** to the appropriate file in `lua/plugins/specs/`:

```lua
-- Example: Adding a new UI plugin in lua/plugins/specs/ui.lua
return {
  -- Existing plugins...
  
  -- Add your new plugin
  {
    "username/new-plugin",
    dependencies = { "some-dependency" }, -- Optional dependencies
    config = function()
      require("plugins.configs.new-plugin")
    end,
  },
}
```

1. **Create a configuration file** in `lua/plugins/configs/`:

```lua
-- lua/plugins/configs/new-plugin.lua
------------------------------------------
-- New Plugin Configuration
------------------------------------------

require("new-plugin").setup({
  -- Your plugin options here
  option1 = true,
  option2 = "value",
})

-- Optional additional settings or keymaps
vim.keymap.set("n", "<leader>np", "<cmd>NewPluginCommand<CR>", { desc = "New Plugin action" })
```

1. **Run `:Lazy sync`** in Neovim to install the new plugin

## Customizing Existing Plugins

To modify an existing plugin configuration:

1. Open the relevant file in `lua/plugins/configs/`
2. Edit the options inside the `setup()` function
3. Save the file and restart Neovim (or run `:source %` if editing the current config)

```lua
-- Example: Customizing telescope in lua/plugins/configs/telescope.lua
telescope.setup({
  defaults = {
    -- Modified options
    layout_strategy = "horizontal", -- Changed from vertical
    prompt_prefix = "🔍 ",          -- Added icon
  },
})
```

## Key Bindings

Key bindings are organized into several layers:

- **Core key bindings**: Basic mappings in `core/keymaps.lua`
- **Plugin-specific bindings**: Found in each plugin's config file
- **Command groups**: Managed by which-key for easy discovery:
  - `<leader>f` - File operations (Telescope)
  - `<leader>b` - Buffer operations
  - `<leader>g` - Git operations
  - `<leader>l` - LSP operations
  - `<leader>vs` - Python venv selection
  - `<leader>fm` - Format file with conform

Use `<leader>?` to see all available key bindings.

## Troubleshooting

If you encounter issues:

1. **Plugin loading problems**:
   - Check `:checkhealth` for plugin-related issues
   - Ensure dependencies are correctly specified
   - Look for errors in the specific plugin config file

2. **Conflicts between plugins**:
   - Check for duplicate key bindings across plugin configs
   - Ensure plugin load order is correct (some plugins must load before others)

3. **Performance issues**:
   - Consider lazy-loading more plugins with `event`, `ft`, or `cmd` options
   - Run `:Lazy profile` to see plugin load times

4. **Missing features after updates**:
   - Check the plugin's GitHub repository for breaking changes
   - Update your configurations to match the new plugin API

---

This configuration is designed to be extended and customized to fit your workflow. Experiment, modify, and make it your own!
