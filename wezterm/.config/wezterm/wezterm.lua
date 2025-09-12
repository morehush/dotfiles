-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Efficient keybinding helper function
local act = wezterm.action
local config = wezterm.config_builder()

config = {
	-- term = "xterm256color",
	enable_kitty_graphics = true,
	max_fps = 120,
	initial_cols = 120,
	initial_rows = 40,

	-- Font, font size, and color scheme
	-- font = wezterm.font("CaskaydiaCove NF"),
	-- font = wezterm.font("JetBrainsMono NF"),
	font_size = 11,
	warn_about_missing_glyphs = false,
	-- color_scheme = "Tokyo Night",
	-- color_scheme = "One Dark (Gogh)",
	-- color_scheme = "Ayu Mirage",
	color_scheme = "Catppuccin Mocha",
	-- color_scheme = "nordfox",
	-- color_scheme = "Kanagawa (Gogh)",
	-- color_scheme = "Kanagawa Dragon (Gogh)",
	-- color_scheme = "Everblush",

	-- Appearance
	hide_tab_bar_if_only_one_tab = true,
	-- window_background_opacity = 0.8,
	use_fancy_tab_bar = false,
	-- window_padding = {
	-- 	left = 0,
	-- 	right = 0,
	-- 	top = 0,
	-- 	bottom = 0,
	-- },
}

-- Key bindings configuration
config.keys = {
	-- Split and manage panes
	{ key = "Enter", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },

	-- Tab creation, navigation and management
	{ key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "q", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = act.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = act.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = act.ActivateTab(7) },
	{ key = "l", mods = "CTRL|ALT", action = act.ActivateTabRelative(1) },
	{ key = "h", mods = "CTRL|ALT", action = act.ActivateTabRelative(-1) },
	{ key = "1", mods = "CTRL|ALT", action = act.MoveTab(0) },
	{ key = "2", mods = "CTRL|ALT", action = act.MoveTab(1) },
	{ key = "3", mods = "CTRL|ALT", action = act.MoveTab(2) },
	{ key = "4", mods = "CTRL|ALT", action = act.MoveTab(3) },
	{ key = "5", mods = "CTRL|ALT", action = act.MoveTab(4) },
	{ key = "6", mods = "CTRL|ALT", action = act.MoveTab(5) },
	{ key = "7", mods = "CTRL|ALT", action = act.MoveTab(6) },
	{ key = "8", mods = "CTRL|ALT", action = act.MoveTab(7) },
	{ key = "LeftArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(-1) },
	{ key = "RightArrow", mods = "CTRL|ALT", action = act.MoveTabRelative(1) },

	-- Copy and paste operations
	{ key = "c", mods = "ALT", action = act.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "v", mods = "ALT", action = act.PasteFrom("PrimarySelection") },
	{ key = "v", mods = "ALT", action = act.PasteFrom("Clipboard") },

	-- Font size adjustments
	{ key = "+", mods = "ALT", action = act.IncreaseFontSize },
	{ key = "-", mods = "ALT", action = act.DecreaseFontSize },
	{ key = "*", mods = "ALT", action = act.ResetFontSize },
}
-- Finally, return the configuration to wezterm:
return config
