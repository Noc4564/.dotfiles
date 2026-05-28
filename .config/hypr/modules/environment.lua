-- Layout of the environment
hl.config({
  general = {
    border_size = 3,
    gaps_in = 3,
    gaps_out = 5,
    col = {
      inactive_border = "#5a6eed",
      active_border = "#0324fc",
    },
    layout = "dwindle",
    resize_on_border = true,
  },
  decoration = {
    rounding = 5,
    inactive_opacity = 0.95,
  }
})

-- Animations
-- Curves
hl.curve("whiplash", {
  type = "bezier",
  points = { {0.24, -0.49}, {0.62, 1.16} }
})
hl.curve("whiplash2", {
  type = "bezier",
  points = { {0.73, -1}, {0.2, 1.45} }
})
hl.curve("smooth", {
  type = "bezier",
  points = { {0.17, 0.36}, {0.57, 0.84} }
})

-- Applying the animations
-- window movement
hl.animation ({
  leaf = "windows",
  enabled = true,
  speed = 6,
  bezier = "whiplash",
  style = "slide"
})
-- workspace
hl.animation ({
  leaf = "workspaces",
  enabled = true,
  speed = 8,
  bezier = "whiplash2",
  style = "slidefadevert"
})
-- fades
hl.animation ({
  leaf = "fadePopups",
  enabled = true,
  bezier = "smooth",
  speed = 10
})

