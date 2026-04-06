local wezterm, config = (require "configer")()

config.win32_system_backdrop = "Acrylic"
local winMenu = {
  {
    label = 'PowerShell',
    args = { 'pwsh' },
  },
  {
    label = 'Cmd',
    args = { 'cmd' },
  },
}
for _, i in ipairs(winMenu) do
  table.insert(config.launch_menu, i)
end
config.default_prog = { 'pwsh' }

-- Find installed visual studio version(s) and add their compilation
-- environment command prompts to the menu
--[[for _, vsvers in
  ipairs(
    wezterm.glob('Microsoft Visual Studio/*', 'C:/Program Files (x86)')
  )
do
  local year = vsvers:gsub('Microsoft Visual Studio/', '')
  table.insert(launch_menu, {
    label = 'x64 Native Tools VS ' .. year,
    args = {
      'cmd.exe',
      '/k',
      'C:/Program Files (x86)/'
        .. vsvers
        .. '/BuildTools/VC/Auxiliary/Build/vcvars64.bat',
    },
  })
end]]