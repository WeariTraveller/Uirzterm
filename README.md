# Uirzterm
Personal WezTerm config

# Platform

## Windows
You need [Windhawk](https://windhawk.net)'s mod Translucent Windows to enable
blur effects. Tips:
- Disable `New system colors` in the mod's settings to avoid apps in exclusion
  lists being affected by black boxes.
- Toggle `Ignore mod inclusion/exclusion lists` in the mod's advanced to make
  `Custom process inclusion list` act as a whitelist.
- Create Windhawk's link in `shell:startup` with a flag `-tray-only` to start
  it automatically at user login without showing UI. Or, you can create basic
  tasks in the task scheduler and run them with the highest privileges. In the
  latter way, the acrylic effect will also take effect on the Wezterm with
  administrator privileges.
