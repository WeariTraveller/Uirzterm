local wezterm, config = (require "configer")()
local act = wezterm.action
local MOD = "CTRL|ALT"

config.leader = { key = ",", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
  -- Font Resize
  { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },

  -- Tabs
  { key = "t", mods = MOD, action = act.SpawnTab "CurrentPaneDomain" },
  { key = "w", mods = MOD, action = act.CloseCurrentTab { confirm = true } },
  { key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
  { key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

  -- Panes
  { key = "d", mods = MOD, action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "D", mods = MOD, action = act.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "h", mods = MOD, action = act.ActivatePaneDirection "Left" },
  { key = "l", mods = MOD, action = act.ActivatePaneDirection "Right" },
  { key = "k", mods = MOD, action = act.ActivatePaneDirection "Up" },
  { key = "j", mods = MOD, action = act.ActivatePaneDirection "Down" },
  { key = "x", mods = MOD, action = act.CloseCurrentPane { confirm = false } },
  { key = "N", mods = MOD, action = act.ShowLauncherArgs { flags = "FUZZY|LAUNCH_MENU_ITEMS" } },
  { key = "1", mods = "ALT", action = act.ActivateTab(0) },
  { key = "2", mods = "ALT", action = act.ActivateTab(1) },
  { key = "3", mods = "ALT", action = act.ActivateTab(2) },
  { key = "4", mods = "ALT", action = act.ActivateTab(3) },
  { key = "5", mods = "ALT", action = act.ActivateTab(4) },

  -- Enter to copy
  {
    key = "Enter",
    mods = "NONE",
    action = wezterm.action_callback(function(window, pane)
      local has_sel = window:get_selection_text_for_pane(pane) ~= ""
      if has_sel then
        window:perform_action(act.CopyTo "ClipboardAndPrimarySelection", pane)
        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.SendKey { key = "Enter", mods = "NONE" }, pane)
      end
    end),
  },

  -- Search
  { key = "f", mods = MOD, action = act.Search "CurrentSelectionOrEmptyString" },

  -- Clean
  { key = "k", mods = MOD, action = act.ClearScrollback "ScrollbackAndViewport" },
}

config.mouse_bindings = {
  -- Paste when right-clicking
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = act.PasteFrom "Clipboard",
  },
  -- Open link via ctrl+click
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = act.OpenLinkAtMouseCursor,
  },
  -- Double click to select and copy
  {
    event = { Up = { streak = 2, button = "Left" } },
    mods = "NONE",
    action = act.CompleteSelection "ClipboardAndPrimarySelection",
  },
}
