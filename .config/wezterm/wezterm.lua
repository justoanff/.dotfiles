local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Window setup
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Font settings
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0
config.line_height = 1.2

-- Appearance
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.65
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0, right = 0, top = 0, bottom = 0,
}

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Behavior
config.window_close_confirmation = "NeverPrompt"
config.keys = {
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentTab({ confirm = false }),
  },
}

return config
