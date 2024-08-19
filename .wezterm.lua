local wezterm = require 'wezterm'

local config = wezterm.config_builder()

--
-- Font Configuration
--
config.font = wezterm.font_with_fallback {
    'Berkeley Mono Variable',
    'Noto Color Emoji',
}
config.font_size = 16

--
-- Color Configuration
--
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Colors (base16)'
-- config.color_scheme = 'Windows 95 (base16)'
-- config.color_scheme = 'Spacedust'
-- config.color_scheme = 'Symfonic'
-- config.color_scheme = 'synthwave'
-- config.color_scheme = 'Retro'
-- config.color_scheme = 'Outrun Dark (base16)'
-- config.color_scheme = 'Obsidian'
config.color_scheme = 'Apple Classic'
-- config.color_scheme = 'Apple System Colors'
-- config.color_scheme = 'Ibm3270 (Gogh)'

--
-- Keybinding Configuration
--
config.keys = {
    { key = 'F11', action = wezterm.action.ToggleFullScreen },
}

--
-- Miscellaneous Configuration
--
config.front_end = 'WebGpu'
config.hide_tab_bar_if_only_one_tab = true

return config
