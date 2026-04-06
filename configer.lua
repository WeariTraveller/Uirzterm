local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local target = wezterm.target_triple
return function()
  return wezterm, config, target
end