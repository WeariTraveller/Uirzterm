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
config.front_end = "WebGpu"

-- Window
config.font_size = 12
config.font = wezterm.font_with_fallback({
  "Sarasa Term SC",
})
require "lua.themes"
config.color_scheme = "Tokyo Day Soft Edited"
config.window_background_opacity = 0
bgImage = os.getenv("wzBgPath") or (wezterm.config_dir .. "/images/" .. (os.getenv("wzBg") or "aloneInRain.png"))
config.background = {
  {
    -- bg color of One Half Dark
    -- used to ensure overall darkness, regardless of others
    source = { Color = "#282c34" },
    opacity = 0.4,
    width = "100%",
    height = "100%",
  },
  {
    source = {
      File = bgImage,
    },
    opacity = 0.3,
    hsb = { brightness = 0.7 },
    horizontal_align = "Center",
    vertical_align = "Middle",
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
wezterm.on(
  "update-right-status",
  function(window, pane)
    window:set_right_status(wezterm.format {
      { Text = "Cmdpicker<Alt-,><space>  REPL<Shit-Ctrl-L>" },
    })
  end
)
