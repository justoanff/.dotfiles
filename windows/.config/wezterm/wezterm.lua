-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration table
local config = {}

-- In newer versions of wezterm, use the config_builder which is recommended
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Set the default program to be PowerShell 7+
-- 'pwsh.exe' is for modern, cross-platform PowerShell (Recommended)
-- '-NoLogo' is an optional argument to hide the copyright banner on startup
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- If you want to use the older Windows PowerShell 5.1 that comes with Windows:
-- config.default_prog = { 'powershell.exe', '-NoLogo' }

-- Font settings
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
  "Cascadia Code",
  "Consolas"
})
config.font_size = 14
config.line_height = 1

-- Appearance
config.color_scheme = "Tokyo Night"
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Behavior
config.window_close_confirmation = "NeverPrompt"

-- Finally, return the configuration table
return config