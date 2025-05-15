-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	enable_kitty_graphics = true,
	max_fps = 120,
	initial_cols = 120,
	initial_rows = 28,

	-- Font, font size, and color scheme
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 11,
	color_scheme = "Tokyo Night",

	-- Appearance
	hide_tab_bar_if_only_one_tab = true,

	window_padding = {
		left = 2,
		right = 2,
		top = 15,
		bottom = 0,
	},
}
-- Finally, return the configuration to wezterm:
return config
