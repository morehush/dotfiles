-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action
-- Efficient keybinding helper function
local function key_binding(key_table)
	local result = {}
	for i, binding in ipairs(key_table) do
		table.insert(result, {
			mods = binding[1] or "ALT",
			key = binding[2],
			action = binding[3],
		})
	end
	return result
end
-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	term = "xterm256color",
	enable_kitty_graphics = true,
	max_fps = 120,
	initial_cols = 120,
	initial_rows = 28,

	-- Font, font size, and color scheme
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 11,
	color_scheme = "Tokyo Night",

	-- Appearance
	-- hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.8,
	use_fancy_tab_bar = false,
}

-- Key bindings configuration
config.keys = key_binding({
	-- Split and manage panes
	{ "ALT", "Enter", act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ "ALT", "\\", act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ "ALT", "w", act.CloseCurrentPane({ confirm = true }) },
	{ "ALT", "h", act.ActivatePaneDirection("Left") },
	{ "ALT", "l", act.ActivatePaneDirection("Right") },
	{ "ALT", "k", act.ActivatePaneDirection("Up") },
	{ "ALT", "j", act.ActivatePaneDirection("Down") },

	-- Tab creation, navigation and management
	{ "ALT", "t", act.SpawnTab("CurrentPaneDomain") },
	{ "ALT", "q", act.CloseCurrentTab({ confirm = true }) },
	{ "ALT", "1", act.ActivateTab(0) },
	{ "ALT", "2", act.ActivateTab(1) },
	{ "ALT", "3", act.ActivateTab(2) },
	{ "ALT", "4", act.ActivateTab(3) },
	{ "ALT", "5", act.ActivateTab(4) },
	{ "ALT", "6", act.ActivateTab(5) },
	{ "ALT", "7", act.ActivateTab(6) },
	{ "ALT", "8", act.ActivateTab(7) },
	{ "CTRL|ALT", "k", act.ActivateLastTab },
	{ "CTRL|ALT", "j", act.ActivateLastTab },
	{ "CTRL|ALT", "1", act.MoveTab(0) },
	{ "CTRL|ALT", "2", act.MoveTab(1) },
	{ "CTRL|ALT", "3", act.MoveTab(2) },
	{ "CTRL|ALT", "4", act.MoveTab(3) },
	{ "CTRL|ALT", "5", act.MoveTab(4) },
	{ "CTRL|ALT", "6", act.MoveTab(5) },
	{ "CTRL|ALT", "7", act.MoveTab(6) },
	{ "CTRL|ALT", "8", act.MoveTab(7) },
	{ "CTRL|ALT", "LeftArrow", act.MoveTabRelative(-1) },
	{ "CTRL|ALT", "RightArrow", act.MoveTabRelative(1) },

	-- Copy and paste operations
	{ "ALT", "c", act.CopyTo("ClipboardAndPrimarySelection") },
	{ "ALT", "v", act.PasteFrom("PrimarySelection") },
	{ "ALT", "v", act.PasteFrom("Clipboard") },

	-- Font size adjustments
	{ "ALT", "+", act.IncreaseFontSize },
	{ "ALT", "-", act.DecreaseFontSize },
	{ "ALT", "*", act.ResetFontSize },
})
-- Finally, return the configuration to wezterm:
return config
