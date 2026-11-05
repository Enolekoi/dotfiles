-- ==========================================
-- Monitor Configuration
-- ==========================================

-- Default display (ThinkPad)
hl.monitor({
  output    = "eDP-1",
  mode      = "1920x1080",
  position  = "0x0",
  scale     = 1.0,
})

-- Optional external display
-- hl.monitor({
--   output   = "HDMI-A-1",
--   mode     = "3840x2160",
--   position = "0x0",
--   scale    = 1.0,
-- })

-- Fallback monitor configuration
hl.monitor({
  output    = "",
  mode      = "1680x1050",
  position  = "0x-1080",
  scale     = 1.0,
})

-- HDMI display
hl.monitor({
  output    = "HDMI-A-2",
  mode      = "1920x1080",
  position  = "0x-1080",
  scale     = 1.0,
})

-- ==========================================
-- Optional: Mirror display
-- ==========================================

-- For plugging in random displays
-- hl.monitor({
--   name     = "",
--   mode     = "preferred",
--   position = "auto",
--   scale    = 1.0,
--   mirror   = "eDP-1",
-- })


-- ==========================================
-- Split Monitor Workspaces Plugin
-- ==========================================

-- hl.plugin("split-monitor-workspaces", {
--   count                         = 10,
--   keep_focused                  = 0,
--   enable_notifications          = 0,
--   enable_persistent_workspaces  = 1,
-- })
