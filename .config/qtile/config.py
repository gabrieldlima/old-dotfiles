# qtile
# Version: 0.21.0-1

import os
import subprocess
from libqtile.lazy import lazy
from libqtile import bar, layout, widget, hook
from libqtile.utils import guess_terminal
from libqtile.config import Click, Drag, Group, Key, Match, Screen




# USER VARS

mod        = "mod4"
alt        = "mod1"
shift      = "shift"
control    = "control"
leftclick  = "Button1"
rightclick = "Button3"

terminal     = "alacritty"
web_browser  = "brave"
file_browser = "nautilus"
launcher     = "/home/gabriel/.config/rofi/scripts/launcher.sh"




# KEYBINDINGS

mouse = [
    Drag([mod], rightclick, lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Drag([mod], leftclick, lazy.window.set_position_floating(), start=lazy.window.get_position()),
]

keys = [
    # Switch between windows
    Key(
        [mod], "j", 
        lazy.layout.down(), 
        desc = "Move focus down"
    ),
    Key(
        [mod], "k", 
        lazy.layout.up(), 
        desc = "Move focus up"
    ),
    Key(
        [mod], "h", 
        lazy.layout.left(), 
        desc = "Move focus to left"
    ),
    Key(
        [mod], "l", 
        lazy.layout.right(), 
        desc = "Move focus to right"
    ),

    # Move windows between left/right or up/down
    Key(
        [mod, shift], "j", 
        lazy.layout.shuffle_down(), 
        desc = "Move window down"
    ),
    Key(
        [mod, shift], "k", 
        lazy.layout.shuffle_up(), 
        desc = "Move window up"
    ),   Key(
        [mod, shift], "h", 
        lazy.layout.shuffle_left(), 
        desc = "Move window to the left"
    ),
    Key(
        [mod, shift], "l", 
        lazy.layout.shuffle_right(), 
        desc = "Move window to the right"
    ),

    # Grow windows
    Key(
        [mod, control], "j", 
        lazy.layout.grow_down(), 
        desc = "Grow window down"
    ),
    Key(
        [mod, control], "k", 
        lazy.layout.grow_up(), 
        desc = "Grow window up"
    ),
    Key(
        [mod, control], "h", 
        lazy.layout.grow_left(), 
        desc = "Grow window to the left"
    ),
    Key(
        [mod, control], "l", 
        lazy.layout.grow_right(), 
        desc = "Grow window to the right"
    ),

    # Toggle between different layouts as defined below
    Key(
        [mod], "space", 
        lazy.next_layout(), 
        desc = "Toggle between layouts"
    ),
    Key(
        [mod, shift], "space", 
        lazy.prev_layout(), 
        desc = "Toggle between layouts"
    ),
    Key(
        [alt], "Tab", 
        lazy.layout.next(), 
        desc = "Move window focus to another window"
    ),  
    Key(
        [mod, shift], "c", 
        lazy.window.kill(), 
        desc = "Kill focused window"
    ),
    Key(
        [mod], "f",
        lazy.window.toggle_fullscreen(),
        desc = "Put the focused window to/from fullscreen"
    ),

    # Qtile
    Key(
        [mod, shift], "r", 
        lazy.reload_config(), 
        desc = "Reload the config"
    ),
    Key(
        [mod, shift], "q", 
        lazy.shutdown(),
        desc = "Reload the config"
    ),

    # My Apps
    Key(
        [mod], "d", 
        lazy.spawn(launcher), 
        desc = "Launch prompt"
    ),
    Key(
        [mod], "Return", 
        lazy.spawn(terminal), 
        desc = "Launch terminal"
    ),
    Key(
        [mod], "b", 
        lazy.spawn(web_browser), 
        desc = "Launch web browser"
    ),
    Key(
        [mod], "e", 
        lazy.spawn(file_browser), 
        desc = "Launch file manager"
    )
]




# GROUPS
groups = [
    Group("1", label = ''),                                                         
    Group("2", label = ''),                                                         
    Group("3", label = ''),                                                         
    Group("4", label = ''),                                                         
    Group("5", label = ''),                                                         
    Group("6", label = ''),                                                        
    Group("7", label = ''),                                                        
    Group("8", label = ''),                                                         
    Group("9", label = '') 
]

for i in groups:
    keys.extend(
        [
            # Switch to group
            Key(
                [mod], i.name,
                lazy.group[i.name].toscreen(),
                desc = "Switch to group {}".format(i.name)
            ),
            # Move focused window to group
            Key(
                [mod, shift], i.name,
                lazy.window.togroup(i.name),
                desc = "Move focused window to group {}".format(i.name)
            )
        ]
    )




# COLORS

color = [
    ["#10151B", "#10151B"],
    ["#98D1CE", "#98D1CE"],
    ["#434C5E", "#434C5E"],
    ["#10151B", "#10151B"],
    ["#D3EBE9", "#D3EBE9"],
]




# LAYOUTS

layout_theme = {
    "margin": 5,
    "border_width": 2,
    "border_focus": color[1],
    "font": "FiraCode Nerd Font"
}

layouts = [
    layout.Columns(
        margin = 5,
        border_width = 2,
        border_focus  = "#5E81AC",
        border_normal = "#0d1117",
        border_on_single = True,
    ),
    #layout.MonadTall(**layout_theme),
    #layout.MonadWide(**layout_theme),
    #layout.Floating(**layout_theme),
    #layout.Max(**layout_theme),
    #layout.MonadThreeCol(**layout_theme),
    #layout.Slice(**layout_theme),
    #layout.Spiral(**layout_theme),
    #layout.Stack(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.Tile(**layout_theme),
    #layout.TreeTab(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Zoomy(**layout_theme),
]




# WIDGETS + BAR

widget_defaults = dict(
    font = "FiraCode Nerd Font",
    fontsize = 12,
    padding = 5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
# ARCH LOGO
#------------------------------------------------------------------------------
                widget.Image(
                    filename = "/home/gabriel/.config/qtile/icons/ArchLinux.png",
                    background = color[3],
                    margin_x = 5,
                    margin_y = 3,
                ),

# GROUP BOX
#------------------------------------------------------------------------------
                widget.GroupBox(
                    rounded = False,
                    borderwidth = 0,
                    disable_drag = True,
                    background = color[0],
                    active = color[1],
                    inactive = color[2],
                    highlight_method = "line",
                    highlight_color = color[0],
                    block_highlight_text_color = color[4],

                ),
               widget.Spacer(),

# LAYOUT
#------------------------------------------------------------------------------
                widget.CurrentLayoutIcon(
                    custom_icon_paths = ["/home/gabriel/.config/qtile/icons/Layouts"],
                    padding = 0,
                    scale = 0.6,
                    foreground = color[1],
                    background = color[0],
                ),
                
# SYSTRAY
#------------------------------------------------------------------------------
                widget.Systray(
                    icon_size = 19,
                    background = color[0]
                ),

# KEYBOARD
#------------------------------------------------------------------------------
                widget.TextBox(
                    text = '  ',
                    padding = 0,
                    fontsize = 20,
                    foreground = color[1],
                    background = color[3]
                ),
                widget.KeyboardLayout(
                    configured_keyboards = ["us", "br abnt2"],
                    display_map = {"us":"US", "br abnt2":"BR" },
                    foreground = color[1],
                    background = color[3]
                ),

# CLOCK
#------------------------------------------------------------------------------
                widget.Clock(
                    foreground = color[1],
                ),
            ],
            30,
            margin = [5,5,0,5],
            background = color[0],
        ),
    ),
]




# RULES

floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="openrgb"),
        Match(wm_class="Pavucontrol"),
        Match(wm_class="Piper"),
        Match(wm_class="Lxappearance")
    ]
)




# CONFIGURATION VARIABLES

dgroups_key_binder = None
dgroups_app_rules = []  # type: list

auto_minimize = True
auto_fullscreen = True

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

focus_on_window_activation = "smart"

reconfigure_screens = True

wl_input_rules = None

wmname = "LG3D"




# FUNCTIONS

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])
