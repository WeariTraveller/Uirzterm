-- Basic Style
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.tab_max_width = 25

-- Render
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.max_fps = 60
config.animation_fps = 60
-- (at least on Windows) it'll influence how non-title behaves
config.front_end = "WebGpu"

-- Window
config.font_size = 12
config.font = wezterm.font_with_fallback({
  "Sarasa Term SC",
})
require "lua.themes"
config.color_scheme = "Tokyo Day Soft Edited"
config.window_background_opacity = 0.3
config.background = {
  {
    source = { File = wezterm.config_dir .. "/background.png" },
    opacity = 0.72,
    hsb = {
      brightness = 0.63,
      saturation = 1.0,
    },
    horizontal_align = "Center",
    vertical_align = "Middle",
  },
  {
    source = { Color = "#05080c" },
    opacity = 0.29,
    width = "100%",
    height = "100%",
  },
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
  left = 10,
  right = 10,
  top = 0,
  bottom = 10,
}
config.initial_cols = 150
config.initial_rows = 30
config.window_close_confirmation = "NeverPrompt"

-- About mouse
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.scrollback_lines = 10000
config.enable_scroll_bar = true
config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
  regex = [[\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b]],
  format = "mailto:$0",
})

-- Tab bar
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  if tab.is_active then return {
    { Text = " 󰆍 " .. title .. " " },
  } end
  return " " .. title .. " "
end)
