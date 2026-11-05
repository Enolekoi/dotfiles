
-- ==========================================
-- Startup Configuration
-- ==========================================

-- Environment variables
hl.env("GTK_THEME", "catppuccin-mocha-yellow-standard+default")

-- Uncomment if needed for Zoom desktop sharing
-- hl.env("XDG_CURRENT_DESKTOP", "gnome")


-- ==========================================
-- Commands executed on every config reload
-- ==========================================

-- Automatically apply the current hyprshade configuration
hl.exec_cmd("hyprshade auto")


-- ==========================================
-- Commands executed only when Hyprland starts
-- ==========================================

hl.on("hyprland.start", function()
  -- Reload Hyprland plugins
  hl.exec_cmd("hyprpm reload -n")
  -- Alternative:
  -- hl.exec_cmd(os.getenv("HOME") .. "/.local/share/hyprload/src/hyprload.sh")

  -- Start Pyprland daemon
  hl.exec_cmd("pypr")

  -- Start Waybar
  hl.exec_cmd("waybar")

  -- Update D-Bus environment
  hl.exec_cmd("dbus-update-activation-environment --systemd HYPRLAND_INSTANCE_SIGNATURE")

  -- Start notification center
  hl.exec_cmd("GDK_BACKEND=wayland swaync")

  -- Start udiskie (automounting)
  hl.exec_cmd("udiskie")

  -- Start hyprpaper
  hl.exec_cmd("hyprpaper")

  -- Load random wallpaper after hyprpaper has started
  hl.exec_cmd("sleep 1 && $HOME/.local/bin/randomwall.sh")

  -- Update Wayland session environment
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Import environment into systemd
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Optional: Start hypridle
  -- hl.exec_cmd("hypridle")

  -- Optional: Start swayidle
  -- hl.exec_cmd("swayidle -w")
end)
