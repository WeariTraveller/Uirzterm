config.launch_menu = {}
config.term = "wezterm"
config.enable_scroll_bar = true
config.min_scroll_bar_height = "1cell"

config.ssh_domains = wezterm.default_ssh_domains()
for _, dom in ipairs(config.ssh_domains) do
  if dom.multiplexing == "None" then dom.assume_shell = "Posix" end
end
