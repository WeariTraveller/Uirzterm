local wezterm, config, target = (require "configer")()

require "prefer"
if target:find('windows') ~= nil then
  require "windows"
elseif target:find('darwin') ~= nil then
  require "darwin"
elseif target:find('linux') ~= nil then
  require "liunx"
end
require "ui"
require "keymaps"
require "plugins"

return config