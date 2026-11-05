-- ==========================================
-- Workspace Rules
-- ==========================================

-- TV workspace
hl.workspace_rule({
  workspace = "w[tv1]",
  gaps_out  = 0,
  gaps_in   = 0,
})

-- Fullscreen workspace
hl.workspace_rule({
  workspace = "f[1]",
  gaps_out  = 0,
  gaps_in   = 0,
})


-- ==========================================
-- Window Rules
-- ==========================================

-- TV workspace: remove borders and rounding
hl.window_rule({
  match       = {
    float = false,
    workspace = "w[tv1]",
  },
  border_size = 0,
  rounding    = 0,
})

-- Fullscreen workspace: remove borders and rounding
hl.window_rule({
  match       = {
    float = false,
    workspace = "f[1]",
  },
  border_size = 0,
  rounding    = 0,
})

-- ==========================================
-- Bluetooth Scratchpad Border Colors
-- ==========================================

-- Active border: yellow-orange gradient
hl.window_rule({
  match = {
    class = "blueman-manager",
    focus = true,
  },
  border_color = {
    colors = {
      "rgba(f9e2afff)",
      "rgba(fab387ff)",
    },
    angle = 45,
  },
})

-- Inactive border: grey
hl.window_rule({
  match = {
    class = "blueman-manager",
    focus = false,
  },
  border_color = "rgba(595959aa)",
})

-- ==========================================
-- Pyprland Exposed Workspace
-- ==========================================
hl.workspace_rule({
  workspace   = "special:exposed",
  gaps_out    = 60,
  gaps_in     = 30,
  border_size = 5,
  no_shadow   = true,
})
