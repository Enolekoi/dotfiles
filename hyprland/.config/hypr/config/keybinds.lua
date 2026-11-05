-- ============================================================
-- MODIFIER
-- ============================================================

local mainMod = "SUPER"

-- ============================================================
-- HILFSFUNKTIONEN
-- ============================================================

local function bind_cmd(keys, command, flags)
  hl.bind(keys, hl.dsp.exec_cmd(command), flags)
end

--
-- Split Monitor Workspaces laden.
-- Wenn das Modul nicht verfügbar ist, werden normale
-- Hyprland-Workspace-Bindings verwendet.

local smw_ok, smw = pcall(
  require,
  "plugins.split-monitor-workspaces"
)

-- ============================================================
-- WINDOW MANAGER OPTIONS
-- ============================================================

-- Kill active window (SUPER + Q)
hl.bind(
  mainMod .. " + Q",
  hl.dsp.window.close()
)

-- Exit menu (SUPER + X)
bind_cmd(
  mainMod .. " + X",
  "~/.local/bin/menus/powermenu"
)

-- Exit Hyprland (SUPER + SHIFT + Q)
hl.bind(
  mainMod .. " + SHIFT + Q",
  hl.dsp.exit()
)

-- Toggle Gaps (SUPER + G)
bind_cmd(
  mainMod .. " + G",
  "~/.config/hypr/scripts/toggle-gaps.sh"
)

-- Toggle Floating Status (SUPER + F)
hl.bind(
  mainMod .. " + F",
  hl.dsp.window.float()
)

-- Toggle Fullscreen Status (SUPER + SHIFT + F)
hl.bind(
  mainMod .. " + SHIFT + F",
  hl.dsp.window.fullscreen()
)

-- Toggle pseudo-tiling (SUPER + SHIFT + P)
hl.bind(
  mainMod .. " + SHIFT + P",
  hl.dsp.window.pseudo()
)

-- Toggle Horizontal/Vertical Split (SUPER + J)
hl.bind(
  mainMod .. " + J",
  hl.dsp.layout("togglesplit")
)

-- Restart Waybar (SUPER + W)
bind_cmd(
  mainMod .. " + W",
  "~/.local/bin/bar/restartbar.sh"
)

-- Show all windows using expose (pyprland)
bind_cmd(
  mainMod .. " + E",
  "pypr expose"
)

-- ============================================================
-- WORKSPACES / MONITORS
-- ============================================================

-- Move focus between monitors (SUPER + M)
bind_cmd(
  mainMod .. " + M",
  "hyprctl dispatch focusmonitor +1"
)

-- Move window between monitors (SUPER + SHIFT + M)
bind_cmd(
  mainMod .. " + SHIFT + M",
  "hyprctl dispatch movecurrentworkspacetomonitor +1"
)

-- Workspace switching and moving windows.
-- Use split-monitor-workspaces only if the module loaded.

if smw_ok then
  for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)

    if n == "10" then
      n = "0"
    end

    -- Focus workspace on the currently focused monitor
    hl.bind(
      mainMod .. " + " .. n,
      smw.workspace(n)
    )

    -- Move active window silently to workspace
    hl.bind(
      mainMod .. " + SHIFT + " .. n,
      smw.move_to_workspace_silent(n)
    )
  end
else
  -- Standard Hyprland workspace bindings
  for i = 1, 10 do
    local n = tostring(i)

    if n == "10" then
      n = "0"
    end

    -- Focus workspace
    bind_cmd(
      mainMod .. " + " .. n,
      "hyprctl dispatch workspace " .. i
    )

    -- Move active window silently to workspace
    bind_cmd(
      mainMod .. " + SHIFT + " .. n,
      "hyprctl dispatch movetoworkspacesilent " .. i
    )
  end
end

-- Scroll through existing workspaces (SUPER + scroll)
hl.bind(
  mainMod .. " + mouse_down",
  hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
  mainMod .. " + mouse_up",
  hl.dsp.focus({ workspace = "e-1" })
)

-- ============================================================
-- FOCUSING WINDOWS
-- ============================================================

-- Move focus (SUPER + vim keys)
bind_cmd(mainMod .. " + H", "hyprctl dispatch movefocus l")
bind_cmd(mainMod .. " + L", "hyprctl dispatch movefocus r")
bind_cmd(mainMod .. " + J", "hyprctl dispatch movefocus u")
bind_cmd(mainMod .. " + K", "hyprctl dispatch movefocus d")

-- ============================================================
-- MOVING WINDOWS
-- ============================================================

-- Move window (SUPER + SHIFT + vim keys)
bind_cmd(
  mainMod .. " + SHIFT + H",
  "hyprctl dispatch movewindow l"
)

bind_cmd(
  mainMod .. " + SHIFT + L",
  "hyprctl dispatch movewindow r"
)

bind_cmd(
  mainMod .. " + SHIFT + J",
  "hyprctl dispatch movewindow u"
)

bind_cmd(
  mainMod .. " + SHIFT + K",
  "hyprctl dispatch movewindow d"
)

-- ============================================================
-- MOUSE WINDOW MOVEMENT / RESIZING
-- ============================================================

-- Move windows (SUPER + LMB and dragging)
hl.bind(
  mainMod .. " + mouse:272",
  hl.dsp.window.drag(),
  { mouse = true }
)

-- Resize windows (SUPER + RMB and dragging)
hl.bind(
  mainMod .. " + mouse:273",
  hl.dsp.window.resize(),
  { mouse = true }
)

-- ============================================================
-- RESIZING WINDOWS / SUBMAP
-- ============================================================

-- Enter resize submap (SUPER + R)
hl.bind(
  mainMod .. " + R",
  hl.dsp.submap("resize")
)

hl.define_submap("resize", function()
  -- Resize active window
  hl.bind(
    "L",
    hl.dsp.window.resize({
      x = 20,
      y = 0,
      relative = true
    }),
    { repeating = true }
  )

  hl.bind(
    "H",
    hl.dsp.window.resize({
      x = -20,
      y = 0,
      relative = true
    }),
    { repeating = true }
  )

  hl.bind(
    "K",
    hl.dsp.window.resize({
      x = 0,
      y = -20,
      relative = true
    }),
    { repeating = true }
  )

  hl.bind(
    "J",
    hl.dsp.window.resize({
      x = 0,
      y = 20,
      relative = true
    }),
    { repeating = true }
  )

  -- Return to global keymap
  hl.bind("ESCAPE", hl.dsp.submap("reset"))
end)

-- ============================================================
-- PROGRAMS / SCRIPTS
-- ============================================================

-- Load random wallpaper (SUPER + P)
bind_cmd(mainMod .. " + P", "randomwall.sh")

-- Execute Alacritty (SUPER + ENTER)
bind_cmd(mainMod .. " + RETURN", "alacritty")

-- Execute Filemanager (SUPER + D)
bind_cmd(mainMod .. " + D", "nautilus")

-- Application launcher (SUPER + SPACE)
bind_cmd(mainMod .. " + SPACE", "rofi -show drun")

-- Application launcher (SUPER + SHIFT + SPACE)
bind_cmd(
  mainMod .. " + SHIFT + SPACE",
  "rofi -show run"
)

-- Notification center (SUPER + N)
bind_cmd(
  mainMod .. " + N",
  "swaync-client -t -sw"
)

-- ============================================================
-- SPECIAL KEYS
-- ============================================================

-- Screenshots
bind_cmd(
  "PRINT",
  "$HOME/.local/bin/screenshot/captureAll"
)

bind_cmd(
  "CTRL + PRINT",
  "$HOME/.local/bin/screenshot/captureScreen"
)

bind_cmd(
  "CTRL + SHIFT + PRINT",
  "$HOME/.local/bin/screenshot/captureArea"
)

-- ============================================================
-- VOLUME
-- ============================================================

bind_cmd(
  "XF86AudioRaiseVolume",
  "$HOME/.local/bin/media/changeVolume +2"
)

bind_cmd(
  "SHIFT + XF86AudioRaiseVolume",
  "$HOME/.local/bin/media/changeVolume +10"
)

bind_cmd(
  "XF86AudioLowerVolume",
  "$HOME/.local/bin/media/changeVolume -2"
)

bind_cmd(
  "SHIFT + XF86AudioLowerVolume",
  "$HOME/.local/bin/media/changeVolume -10"
)

bind_cmd(
  "XF86AudioMute",
  "$HOME/.local/bin/media/changeVolume m"
)

-- ============================================================
-- BRIGHTNESS
-- ============================================================

bind_cmd(
  "XF86MonBrightnessUp",
  "$HOME/.local/bin/media/changeBrightness +10%"
)

bind_cmd(
  "SHIFT + XF86MonBrightnessUp",
  "$HOME/.local/bin/media/changeBrightness +99%"
)

bind_cmd(
  "XF86MonBrightnessDown",
  "$HOME/.local/bin/media/changeBrightness 10%-"
)

bind_cmd(
  "SHIFT + XF86MonBrightnessDown",
  "$HOME/.local/bin/media/changeBrightness 99%-"
)

-- ============================================================
-- MEDIA KEYS
-- ============================================================

bind_cmd("XF86AudioPrev", "playerctl previous")
bind_cmd("XF86AudioNext", "playerctl next")
bind_cmd("XF86AudioPlay", "playerctl play-pause")

-- ============================================================
-- PYPRLAND / SCRATCHPADS
-- ============================================================

-- Terminal scratchpad (SUPER + Y)
bind_cmd(mainMod .. " + Y", "pypr toggle term")

-- btop scratchpad (SUPER + T)
bind_cmd(mainMod .. " + T", "pypr toggle btop")

-- Bluetooth scratchpad (SUPER + B)
bind_cmd(mainMod .. " + B", "pypr toggle bluetooth")
