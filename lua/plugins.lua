local wezterm, config = (require "configer")()
local plugReq = function(link, isShort)
  isShort = isShort or true
  if isShort then return wezterm.plugin.require("https://github.com/" .. link) end
  return wezterm.plugin.require(link)
end

local cmdpicker = plugReq "abidibo/wezterm-cmdpicker"
cmdpicker.apply_to_config(config)
