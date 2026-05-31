_G.wezterm = require "wezterm"
_G.config = wezterm.config_builder()
_G.target = wezterm.target_triple

require "lua.prefer"
require "lua.ui"
require "lua.keymaps"
require "lua.plugins"
if target:find("windows") ~= nil then
  require "windows"
elseif target:find("darwin") ~= nil then
  require "darwin"
elseif target:find("linux") ~= nil then
  require "liunx"
end

return config
