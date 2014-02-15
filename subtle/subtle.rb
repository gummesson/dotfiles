# -*- encoding: utf-8 -*-

# -- subtle.rb ----------------------------------------------------- {{{
#
# -- Options
# -- Screen
# -- Styles
# -- Gravities
# -- Grabs
# -- Tags
# -- Views
# -- Sublets
#
# }}}

# -- Options ------------------------------------------------------- {{{

set :increase_step,     5
set :border_snap,       10
set :default_gravity,   :center
set :urgent_dialogs,    false
set :honor_size_hints,  false
set :gravity_tiling,    false
set :click_to_focus,    false
set :skip_pointer_warp, false
set :skip_urgent_warp,  false

# }}}

# -- Screen -------------------------------------------------------- {{{

screen 1 do
  top    [ :views, :spacer, :title, :spacer, :tray, :wifi, :battery, :clock ]
  bottom [ ]
end

# }}}

# -- Styles -------------------------------------------------------- {{{

# -- Colors --

solarized = {
  :base03  => "#002b36",
  :base02  => "#073642",
  :base01  => "#586e75",
  :base00  => "#657b83",
  :base0   => "#839496",
  :base1   => "#93a1a1",
  :base2   => "#eee8d5",
  :base3   => "#fdf6e3",
  :yellow  => "#b58900",
  :orange  => "#cb4b16",
  :red     => "#dc322f",
  :magenta => "#d33682",
  :violet  => "#6c71c4",
  :blue    => "#268bd2",
  :cyan    => "#2aa198",
  :green   => "#859900"
}

# -- Settings ---

style :all do
  background solarized[:base03]
  icon       solarized[:base3]
  border     solarized[:base02], 0
  padding    0, 4
  font       "xft:Ubuntu Mono:pixelsize=15"
end

style :views do
  foreground solarized[:base00]

  style :focus do
    foreground solarized[:base3]
    background solarized[:blue]
  end

  style :urgent do
    foreground solarized[:base3]
    background solarized[:red]
  end

  style :occupied do
    foreground solarized[:base3]
    background solarized[:magenta]
  end
end

style :sublets do
  foreground solarized[:base00]
  background solarized[:base03]
end

style :separator do
  foreground solarized[:base00]
  separator  "|"
end

style :title do
  foreground solarized[:base00]
end

style :clients do
  active   solarized[:blue], 2
  inactive solarized[:base00], 2
  margin   0
  width    50
end

style :subtle do
  margin     0, 0, 0, 0
  panel      solarized[:base03]
  background solarized[:base02]
  stipple    solarized[:base00]
end

# }}}

# -- Gravities ----------------------------------------------------- {{{

gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,   0,  33, 100 ]
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]

# }}}

# -- Grabs --------------------------------------------------------- {{{

# -- Programs --

grab "W-Return", "urxvtc"
grab "W-m",      "dmenu_run"

# -- Views --

grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-1",   :ViewSwitch1
grab "W-2",   :ViewSwitch2
grab "W-3",   :ViewSwitch3
grab "W-4",   :ViewSwitch4
grab "W-n",   :ViewNext
grab "W-p",   :ViewPrev

# -- Windows --

grab "W-B1",    :WindowMove
grab "W-B3",    :WindowResize
grab "W-f",     :WindowFloat
grab "W-space", :WindowFull
grab "W-equal", :WindowZaphod
grab "W-S-s",   :WindowStick
grab "W-S-k",   :WindowKill
grab "W-r",     :WindowRaise
grab "W-l",     :WindowLower
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-a", [ :left,         :left66,         :left33         ]
grab "W-s", [ :center,       :center66,       :center33       ]
grab "W-d", [ :right,        :right66,        :right33        ]
grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# -- Subtle --

grab "W-C-r",   :SubtleReload
grab "W-C-S-r", :SubtleRestart
grab "W-C-q",   :SubtleQuit

grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

# }}}

# -- Tags ---------------------------------------------------------- {{{

tag "term",    "xterm|[u]?rxvt"
tag "browser", "uzbl"
tag "editor",  "gvim"

# }}}

# -- Views --------------------------------------------------------- {{{

view "term", "term|default"
view "www",  "browser"
view "dev",  "editor"

# }}}

# -- Sublets ------------------------------------------------------- {{{

sublet :wifi do
  interval 30
  device   "wlp2s0"
end

sublet :battery do
  interval 30
  colors   25 => solarized[:red], 50 => solarized[:yellow], 100 => solarized[:green]
end

sublet :clock do
  interval      10
  format_string "%H:%M"
end

# }}}

# vim:foldmethod=marker