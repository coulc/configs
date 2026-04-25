local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.color_scheme = "default"
config.font_size = 18
config.initial_cols = 120
config.initial_rows = 35
config.window_padding = {
  left = 3,
  right = 3,
  top = 0,
  bottom = 0,
}
config.window_background_opacity = 0.65
config.macos_window_background_blur = 20

return config

