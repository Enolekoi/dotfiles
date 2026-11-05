-- ==========================================
-- Window Rules
-- ==========================================


-- ==========================================
-- Opacity Settings
-- ==========================================

-- Firefox
hl.window_rule({
  match = {
    class = "firefox",
  },
  opacity = "1.0 override 1.0 override",
})

-- Audacity
hl.window_rule({
  match = {
    class = "audacity",
  },
  opacity = "1.0 override 1.0 override",
})


-- ==========================================
-- Default Workspace Assignments
-- ==========================================

-- Browser
hl.window_rule({
  match = {
    class = "firefox",
  },
  workspace = "1",
})

-- Messenger
hl.window_rule({
  match = {
    class = "com.ktechpit.whatsie",
  },
  workspace = "8",
})

hl.window_rule({
  match = {
    class = "org.telegram.desktop",
  },
  workspace = "8",
})

hl.window_rule({
  match = {
    class = "discord",
  },
  workspace = "8",
})

hl.window_rule({
  match = {
    class = "Microsoft Teams - Preview",
  },
  workspace = "8",
})


-- ==========================================
-- Media
-- ==========================================

hl.window_rule({
  match = {
    class = "tidal-hifi",
  },
  workspace = "9",
})

hl.window_rule({
  match = {
    class = "Spotify",
  },
  workspace = "9",
})


-- ==========================================
-- Settings
-- ==========================================

hl.window_rule({
  match = {
    class = "nwg-displays",
  },
  workspace = "10",
})

hl.window_rule({
  match = {
    class = "pavucontrol",
  },
  workspace = "10",
})

-- Optional:
-- hl.window_rule({
--   match = {
--     class = "blueman-manager",
--   },
--   workspace = "10",
-- })


-- ==========================================
-- Other
-- ==========================================

-- Alacritty dropdown terminal
hl.window_rule({
  match = {
    class = "alacritty-dropdown",
  },
  float = true,
})
