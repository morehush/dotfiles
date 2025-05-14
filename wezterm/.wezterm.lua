-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config = {
	enable_kitty_graphics = true,
	max_fps = 120,
	initial_cols = 120,
	initial_rows = 28,

	-- or, changing the font size and color scheme.
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 11,
	color_scheme = "Tokyo Night",

	window_padding = {
		left = 2,
		right = 2,
		top = 15,
		bottom = 0,
	},
}
-- Finally, return the configuration to wezterm:
return config
