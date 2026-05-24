local wezterm, config, target = (require "configer")()

require "lua.prefer"
if target:find("windows") ~= nil then
  require "windows"
elseif target:find("darwin") ~= nil then
  require "darwin"
elseif target:find("linux") ~= nil then
  require "liunx"
end
require "lua.ui"
require "lua.keymaps"
require "lua.plugins"

return config
