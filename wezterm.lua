_G.wezterm = require "wezterm"
_G.config = wezterm.config_builder()
_G.target = wezterm.target_triple

package.path = wezterm.config_dir .. "/lua/?.lua;" .. wezterm.config_dir .. "/lua/?/init.lua;" .. package.path

require "prefer"
require "ui"
require "keymaps"
require "plugins"
if target:find("windows") ~= nil then
  require "windows"
elseif target:find("darwin") ~= nil then
  require "darwin"
elseif target:find("linux") ~= nil then
  require "linux"
end

return config
