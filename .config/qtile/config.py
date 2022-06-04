from libqtile.lazy import lazy
from libqtile import bar, layout, widget
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
file_browser = "pcmanfm"
launcher     = "/home/gabriel/.config/rofi/scripts/launcher.sh"




# LAYOUTS

layouts = [
    layout.MonadTall(margin=10),
    layout.MonadWide(margin=10),
    layout.Floating(margin=10),
    #layout.Columns(),
    #layout.Max(),
    #layout.Stack(),
    #layout.Bsp(),
    #layout.Matrix(),
    #layout.RatioTile(),
    #layout.Tile(),
    #layout.TreeTab(),
    #layout.VerticalTile(),
    #layout.Zoomy(),
]




# KEYBINDINGS

mouse = [
    Drag([mod], leftclick, lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], rightclick, lazy.window.set_size_floating(), start=lazy.window.get_size()),
]

keys = [
    # Switch between windows
    Key(
        [mod], "j", 
        lazy.layout.down(), 
        desc="Move focus down"
    ),
    Key(
        [mod], "k", 
        lazy.layout.up(), 
        desc="Move focus up"
    ),
    Key(
        [mod], "h", 
        lazy.layout.left(), 
        desc="Move focus to left"
    ),
    Key(
        [mod], "l", 
        lazy.layout.right(), 
        desc="Move focus to right"
    ),

    # Move windows between left/right or up/down
    Key(
        [mod, shift], "j", 
        lazy.layout.shuffle_down(), 
        desc="Move window down"
    ),
    Key(
        [mod, shift], "k", 
        lazy.layout.shuffle_up(), 
        desc="Move window up"
    ),   Key(
        [mod, shift], "h", 
        lazy.layout.shuffle_left(), 
        desc="Move window to the left"
    ),
    Key(
        [mod, shift], "l", 
        lazy.layout.shuffle_right(), 
        desc="Move window to the right"
    ),

    # Grow windows
    Key(
        [mod, control], "j", 
        lazy.layout.grow_down(), 
        desc="Grow window down"
    ),
    Key(
        [mod, control], "k", 
        lazy.layout.grow_up(), 
        desc="Grow window up"
    ),
    Key(
        [mod, control], "h", 
        lazy.layout.grow_left(), 
        desc="Grow window to the left"
    ),
    Key(
        [mod, control], "l", 
        lazy.layout.grow_right(), 
        desc="Grow window to the right"
    ),

    # Toggle between different layouts as defined below
    Key(
        [mod], "space", 
        lazy.next_layout(), 
        desc="Toggle between layouts"
    ),
    Key(
        [mod, shift], "space", 
        lazy.prev_layout(), 
        desc="Toggle between layouts"
    ),
    Key(
        [alt], "Tab", 
        lazy.layout.next(), 
        desc="Move window focus to another window"
    ),  
    Key(
        [mod, shift], "c", 
        lazy.window.kill(), 
        desc="Kill focused window"
    ),
    Key(
        [mod], "f",
        lazy.window.toggle_fullscreen(),
        desc="Put the focused window to/from fullscreen"
    ),

    # Qtile
    Key(
        [mod, shift], "r", 
        lazy.reload_config(), 
        desc="Reload the config"
    ),
    Key(
        [mod, shift], "q", 
        lazy.shutdown(),
        desc="Reload the config"
    ),

    # My Apps
    Key(
        [mod], "d", 
        lazy.spawn(launcher), 
        desc="Launch prompt"
    ),
    Key(
        [mod], "Return", 
        lazy.spawn(terminal), 
        desc="Launch terminal"
    ),
    Key(
        [mod], "b", 
        lazy.spawn(web_browser), 
        desc="Launch web browser"
    ),
    Key(
        [mod], "e", 
        lazy.spawn(file_browser), 
        desc="Launch file manager"
    )
]




# GROUPS

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, shift],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, shift], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )




# WIDGETS + BAR

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    # font="Fira Code Nerd Font",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox("", foreground="#269ad4"), 
                widget.GroupBox(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CurrentLayout(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]




# RULES

floating_layout = layout.Floating(
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
