-- ==========================================
-- General Options
-- ==========================================

hl.config({
  general = {
    border_size     = 2,
    gaps_in         = 3,
    gaps_out        = 10,
    gaps_workspaces = 0,

    col = {
      inactive_border = "rgba(595959aa)",
      active_border = {
        colors = {
          "rgba(f9e2afff)",
          "rgba(fab387ff)"
        },
        angle = 45
      }
    },

    layout = "dwindle",
    -- layout = "master",

    resize_on_border        = true,
    extend_border_grab_area = 20,
    hover_icon_on_border    = true,
    allow_tearing           = false,
    },

    -- ==========================================
    -- Decoration
    -- ==========================================

  decoration = {
    rounding            = 12,

    active_opacity      = 1.00,
    inactive_opacity    = 0.93,
    fullscreen_opacity  = 1.00,

    -- Shadow disabled (original settings commented out)

    dim_inactive        = true,
    dim_strength        = 0.05,
    dim_special         = 0.2,
    dim_around          = 0.4,

    blur = {
      enabled             = true,
      size                = 4,
      passes              = 3,
      new_optimizations   = true,
      xray                = true,
      noise               = 0.1,
      contrast            = 0.8916,
      brightness          = 0.8172,
      vibrancy            = 0.8,
      vibrancy_darkness   = 0.0,
      special             = false,
      popups              = true,
      popups_ignorealpha  = 0.2,
    },
  },

  -- ==========================================
  -- Animations
  -- ==========================================

  animations = {
    enabled = true,
  },

  -- ==========================================
  -- Input
  -- ==========================================

  input = {
    kb_layout                   = "de",
    kb_options                  = "caps:swapescape",
    repeat_rate                 = 25,

    left_handed                 = false,

    scroll_button               = 0,
    scroll_button_lock          = false,
    natural_scroll              = false,

    follow_mouse                = 1,
    mouse_refocus               = false,
    float_switch_override_focus = 1,
    special_fallthrough         = false,

    touchpad = {
      disable_while_typing    = true,
      natural_scroll          = false,
      scroll_factor           = 1.0,
      middle_button_emulation = false,
      clickfinger_behavior    = false,
      tap_to_click            = true,
      drag_lock               = false,
      tap_and_drag            = false,
    },
  },

  -- ==========================================
  -- Cursor
  -- ==========================================

  cursor = {
    inactive_timeout = 5,
  },

  -- ==========================================
  -- Binds
  -- ==========================================

  binds = {
    pass_mouse_when_bound       = false,
    scroll_event_delay          = 300,
    workspace_back_and_forth    = true,
    allow_workspace_cycles      = true,
    workspace_center_on         = 0,
    focus_preferred_method      = 0,
    ignore_group_lock           = false,
    movefocus_cycles_fullscreen = true,
  },

  -- ==========================================
  -- XWayland
  -- ==========================================

  xwayland = {
    use_nearest_neighbor  = true,
    force_zero_scaling    = false,
  },

  -- ==========================================
  -- OpenGL
  -- ==========================================

  opengl = {
      nvidia_anti_flicker = true,
  },
})


-- ==========================================
-- Animation Curves
-- ==========================================

hl.curve("myBezier", {
  type    = "bezier",
  points  = {
    { 0.05, 0.9 },
    { 0.1, 1.07 }
  }
})


-- ==========================================
-- Animation Definitions
-- ==========================================

-- Window closing animation
hl.animation({
  leaf    = "windowsOut",
  enabled = true,
  speed   = 1,
  bezier  = "default",
  style   = "popin 80%",
})

-- Border animation
hl.animation({
  leaf    = "border",
  enabled = true,
  speed   = 10,
  bezier  = "default",
})

-- Border gradient rotation
hl.animation({
  leaf    = "borderangle",
  enabled = true,
  speed   = 100,
  bezier  = "default",
  style   = "loop",
})

-- Fade animation
hl.animation({
  leaf    = "fade",
  enabled = true,
  speed   = 2,
  bezier  = "default",
})

-- Workspace animation
hl.animation({
  leaf    = "workspaces",
  enabled = true,
  speed   = 2,
  bezier  = "default",
  style   = "slidefade 80%",
})
