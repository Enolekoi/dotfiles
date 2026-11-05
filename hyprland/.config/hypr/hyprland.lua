--  _                      _                 _
-- | |__  _   _ _ __  _ __| | __ _ _ __   __| |
-- | '_ \| | | | '_ \| '__| |/ _` | '_ \ / _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
--        |___/|_|

-- Load configuration modules
-- Modules are loaded independently to allow incremental migration.

local function load_config(module)
  local success, err = pcall(require, module)

  if not success then
    print("[Hyprland Config] Failed to load " .. module .. ": " .. tostring(err))
  end
end

-- Startup
load_config("config.startup")

-- Startup
load_config("config.plugins")

-- Options [general, decoration, animations, input, gestures, group, misc, binds, xwayland, opengl]
load_config("config.options")

-- Monitor Setup
load_config("config.monitor")

-- Layout Options
load_config("config.layout")

-- Window Rules
load_config("config.window_rules")

-- Workspace Rules
load_config("config.workspaces")

-- Keybinds
load_config("config.keybinds")

-- Nvidia
-- load_config("config.nvidia")

