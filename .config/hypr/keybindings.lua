--# █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
--# █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

-- see https://wiki.hyprland.org/configuring/keywords/ for more
-- example binds, see https://wiki.hyprland.org/configuring/binds/ for more

-- Grouping of binds for easier management
--  $d=[Group Name|Subgroup Name1|Subgroup Name2|...]
-- '$d' is a variable that is used to group binds together (or use another variable)
-- This is only for organization purposes and is not a defined hyprland variable
-- What we did here is to modify the Description of the binds to include the group name
-- The $d will be parsed as a separate key to be use for a GUI or something pretty
-- [Main|Subgroup1|Subgroup2|...]
-- Main - The main groupname
-- Subgroup1.. - The subgroup names can be use to avoid repeating the same description


local mainMod = "SUPER"
local srcPath = "/home"
local EDITOR = "zeditor"
local EXPLORER = "thunar"
local BROWSER = "zen-browser"
local TERMINAL = "kitty"
local wm = "Window Management"
local d = "[" .. wm .. "]"
-- hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("$scrPath/dontkillsteam.sh"), { description = "$d close focused window" })
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind("ALT + F4", hl.dsp.exec_cmd("$scrPath/dontkillsteam.sh"), { description = "$d close focused window" })
hl.bind(mainMod .. " + Delete", hl.dsp.exit(), { description = "$d kill hyprland session" })
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "$d toggle float" })
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "$d toggle group" })
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "$d toggle fullscreen" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("lockscreen.sh"), { description = "$d lock screen" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("$scrPath/windowpin.sh"), { description = "$d toggle pin on focused window" })
hl.bind("CONTROL + ALT + Backspace", hl.dsp.exec_cmd("$scrPath/logoutlaunch.sh"), { description = "$d logout menu" })
hl.bind("Alt_R + Control_R", hl.dsp.exec_cmd("killall waybar || (env reload_flag=1 $scrPath/wbarconfgen.sh)"), { description = "$d toggle waybar and reload config" })
-- bindd = ALT_R, Control_R,toggle waybar, exec, killall waybar || waybar # toggle waybar without reloading, this is faster

local d = "[" .. wm .. "|Group Navigation]"
hl.bind(mainMod .. " + CONTROL + H", hl.dsp.group.prev(), { description = "$d change active group backwards" })
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.group.next(), { description = "$d change active group forwards" })

local d = "[" .. wm .. "|Change focus]"
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }), { description = "$d focus left" })
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }), { description = "$d focus right" })
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }), { description = "$d focus up" })
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }), { description = "$d focus down" })
-- bindd = Alt, TAB, $d focus , movefocus, d,

local d = "[" .. wm .. "|Resize Active Window]"
-- Resize windows
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true, description = "$d resize window right" })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true, description = "$d resize window left" })
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true, description = "$d resize window up" })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true, description = "$d resize  window down" })

-- Move active window around current workspace with mainMod + Shift + Control [←→↑↓]
local d = "[" .. wm .. "|Move active window across workspace]"
local moveactivewindow = "grep -q \"true\" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive"
hl.bind(mainMod .. " + ALT + left", hl.dsp.exec_cmd(moveactivewindow .. " -30 0 || hyprctl dispatch movewindow l"), { repeating = true, description = "Move activewindow to the right" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.exec_cmd(moveactivewindow .. " 30 0 || hyprctl dispatch movewindow r"), { repeating = true, description = "Move activewindow to the right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.exec_cmd(moveactivewindow .. "  0 -30 || hyprctl dispatch movewindow u"), { repeating = true, description = "Move activewindow to the right" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.exec_cmd(moveactivewindow .. " 0 30 || hyprctl dispatch movewindow d"), { repeating = true, description = "Move activewindow to the right" })

-- Move/Resize focused window
local d = "[" .. wm .. "|Move & Resize with mouse]"
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "$d hold to move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "$d hold to resize window" })
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), { description = "$d hold to move window" })
-- binddm = $mainMod, X, $d hold to resize window, resizewindow

-- Toggle focused window split
local d = "[" .. wm .. "]"
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "$d toggle split" })

local l = "Launcher"
local d = "[" .. l .. "|Apps]"
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(TERMINAL), { description = "$d terminal emulator" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(EXPLORER), { description = "$d file explorer" })
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(EDITOR), { description = "$d text editor" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(BROWSER), { description = "$d web browser" })
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd("$scrPath/sysmonlaunch.sh"), { description = "$d system monitor" })

local d = "[" .. l .. "|Rofi menus]"
-- local rofi_launch = scrPath .. "/rofilaunch.sh"
hl.bind(mainMod .. " + SUPER_L", hl.dsp.exec_cmd("pkill -x rofi || $rofi-launch d"), { description = "$d application finder" })
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("pkill -x rofi || $rofi-launch w"), { description = "$d window switcher" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("pkill -x rofi || $rofi-launch f"), { description = "$d file finder" })
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/keybinds_hint.sh c"), { description = "$d keybindings hint" })
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/emoji-picker.sh"), { description = "$d emoji  picker" })
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/glyph-picker.sh"), { description = "$d glyph picker" })
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/cliphist.sh -c"), { description = "$d clipboard" })
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/cliphist.sh"), { description = "$d clipboard manager" })
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/rofiselect.sh"), { description = "$d select rofi launcher" })

local hc = "Hardware Controls"
local d = "[" .. hc .. "|Audio]"
-- binddl  = , F10, $d toggle mute output , exec, $scrPath/volumecontrol.sh -o m # toggle audio mute
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("$scrPath/volumecontrol.sh -o m"), { locked = true, description = "$d  toggle mute output" })
-- binddel = , F11, $d decrease volume , exec, $scrPath/volumecontrol.sh -o d # decrease volume
-- binddel = , F12, $d increase volume , exec, $scrPath/volumecontrol.sh -o i # increase volume
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("$scrPath/volumecontrol.sh -i m"), { locked = true, description = "$d un/mute microphone" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("$scrPath/volumecontrol.sh -o d"), { locked = true, repeating = true, description = "$d decrease volume" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("$scrPath/volumecontrol.sh -o i"), { locked = true, repeating = true, description = "$d increase volume" })

local d = "[" .. hc .. "|Media]"
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "$d play media" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "$d pause media" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "$d next media" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "$d  previous media" })

local d = "[" .. hc .. "|Brightness]"
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$scrPath/brightnesscontrol.sh i"), { locked = true, repeating = true, description = "$d increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$scrPath/brightnesscontrol.sh d"), { locked = true, repeating = true, description = "$d decrease brightness" })

local ut = "Utilities"
local d = "[" .. ut .. "]"
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("$scrPath/keyboardswitch.sh"), { description = "$d toggle keyboard layout" })
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd("$scrPath/gamemode.sh"), { description = "$d game mode" })

local d = "[" .. ut .. "|Screen Capture]"
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -an"), { description = "$d color picker" })
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("$scrPath/screenshot.sh s"), { description = "$d snip screen" })
hl.bind(mainMod .. " + CONTROL + P", hl.dsp.exec_cmd("$scrPath/screenshot.sh sf"), { description = "$d freeze and snip screen" })
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("$scrPath/screenshot.sh m"), { description = "$d print monitor" })
hl.bind("Print", hl.dsp.exec_cmd("$scrPath/screenshot.sh p"), { description = "$d print all monitors" })

-- TODO Make a main rofi menu for these selectors
local rice = "Theming and Wallpaper"
local d = "[" .. rice .. "]"
-- bindd = $mainMod Alt, Right, $d next wallpaper , exec, $scrPath/swwwallpaper.sh -n # next wallpaper
-- bindd = $mainMod Alt, Left, $d previous wallpaper , exec, $scrPath/swwwallpaper.sh -p # previous wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/swwwallselect.sh"), { description = "$d select a wallpaper" })
-- bindd = $mainMod Alt, Up, $d next waybar layout , exec, $scrPath/wbarconfgen.sh n # next waybar mode
-- bindd = $mainMod Alt, Down, $d previous waybar layout , exec, $scrPath/wbarconfgen.sh p # previous waybar mode
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/wallbashtoggle.sh -m"), { description = "$d wallbash mode selector" })
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("pkill -x rofi || $scrPath/themeselect.sh"), { description = "$d select a theme" })

local ws = "Workspaces"
local d = "[" .. ws .. "|Navigation]"
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }), { description = "$d navigate to workspace 1" })
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }), { description = "$d navigate to workspace 2" })
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }), { description = "$d navigate to workspace 3" })
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }), { description = "$d navigate to workspace 4" })
-- bindd = $mainMod, 5, $d navigate to workspace 5 , workspace, 5
-- bindd = $mainMod, 6, $d navigate to workspace 6 , workspace, 6
-- bindd = $mainMod, 7, $d navigate to workspace 7 , workspace, 7
-- bindd = $mainMod, 8, $d navigate to workspace 8 , workspace, 8
-- bindd = $mainMod, 9, $d navigate to workspace 9 , workspace, 9
-- bindd = $mainMod, 0, $d navigate to workspace 10 , workspace, 10

local d = "[" .. ws .. "|Navigation|Relative workspace]"
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "r+1" }), { description = "$d change active workspace forwards" })
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "r-1" }), { description = "$d change active workspace backwards" })

local d = "[" .. ws .. "|Navigation]"
hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "empty" }), { description = "$d navigate to the nearest empty workspace" })

-- Move focused window to a workspace
local d = "[" .. ws .. "|Move window to workspace]"
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }), { description = "$d move to workspace 1" })
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }), { description = "$d move to workspace 2" })
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }), { description = "$d move to workspace 3" })
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }), { description = "$d move to workspace 4" })
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }), { description = "$d move to workspace 5" })
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }), { description = "$d move to workspace 6" })
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }), { description = "$d move to workspace 7" })
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }), { description = "$d move to workspace 8" })
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }), { description = "$d move to workspace 9" })
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }), { description = "$d move to workspace 10" })

-- Move focused window to a relative workspace
local d = "[" .. ws .. "]"
hl.bind(mainMod .. " + CONTROL + ALT + Right", hl.dsp.window.move({ workspace = "r+1" }), { description = "$d move window to next relative workspace" })
hl.bind(mainMod .. " + CONTROL +ALT + Left", hl.dsp.window.move({ workspace = "r-1" }), { description = "$d move window to previous relative workspace" })

-- Scroll through existing workspaces
local d = "[" .. ws .. "|Navigation]"
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "$d next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "$d previous workspace" })

-- Move/Switch to special workspace (scratchpad)
local d = "[" .. ws .. "|Navigation|Special workspace]"
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special" }), { description = "$d move to scratchpad" })
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }), { description = "$d move to scratchpad (silent)" })
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(""), { description = "$d toggle scratchpad" })

-- Move focused window to a workspace silently
local d = "[" .. ws .. "|Navigation|Move window silently]"
hl.bind(mainMod .. " + ALT + 1", hl.dsp.window.move({ workspace = 1, follow = false }), { description = "$d move to workspace 1  (silent)" })
hl.bind(mainMod .. " + ALT + 2", hl.dsp.window.move({ workspace = 2, follow = false }), { description = "$d move to workspace 2  (silent)" })
hl.bind(mainMod .. " + ALT + 3", hl.dsp.window.move({ workspace = 3, follow = false }), { description = "$d move to workspace 3  (silent)" })
hl.bind(mainMod .. " + ALT + 4", hl.dsp.window.move({ workspace = 4, follow = false }), { description = "$d move to workspace 4  (silent)" })
hl.bind(mainMod .. " + ALT + 5", hl.dsp.window.move({ workspace = 5, follow = false }), { description = "$d move to workspace 5  (silent)" })
hl.bind(mainMod .. " + ALT + 6", hl.dsp.window.move({ workspace = 6, follow = false }), { description = "$d move to workspace 6  (silent)" })
hl.bind(mainMod .. " + ALT + 7", hl.dsp.window.move({ workspace = 7, follow = false }), { description = "$d move to workspace 7  (silent)" })
hl.bind(mainMod .. " + ALT + 8", hl.dsp.window.move({ workspace = 8, follow = false }), { description = "$d move to workspace 8  (silent)" })
hl.bind(mainMod .. " + ALT + 9", hl.dsp.window.move({ workspace = 9, follow = false }), { description = "$d move to workspace 9  (silent)" })
hl.bind(mainMod .. " + ALT + 0", hl.dsp.window.move({ workspace = 10, follow = false }), { description = "$d move to workspace 10 (silent)" })

local d = "" --! unset the group name
-- pyprland
hl.bind("F12", hl.dsp.exec_cmd("pypr toggle term"))
-- bind = $mainMod, Z, exec, pypr zoom # Toggle Desktop ZZ
