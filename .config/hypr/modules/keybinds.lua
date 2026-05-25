-- setting variables
local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "kitty -e yazi"
local menu = "wofi --show drun"

-- keybinds themselves
-- window management: focus
hl.bind(mainMod .. " + H", hl.dsp.focus({direction = "l"}))
hl.bind(mainMod .. " + J", hl.dsp.focus({direction = "d"}))
hl.bind(mainMod .. " + K", hl.dsp.focus({direction = "u"}))
hl.bind(mainMod .. " + L", hl.dsp.focus({direction = "r"}))
-- window management: movement
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({direction = "l"}))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({direction = "d"}))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({direction = "u"}))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({direction = "r"}))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})
-- workspace management: focus and movement of window to workspace
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({workspace = i}))
end

-- window management: auxilary
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({actgion = toggle}))
-- Quick app launches
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
-- Menus
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/.config/scripts/powermenu.sh"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("~/.config/scripts/screenshot.sh"))

