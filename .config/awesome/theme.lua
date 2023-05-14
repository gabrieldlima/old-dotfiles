local theme_assets  = require("beautiful.theme_assets")
local rnotification = require("ruled.notification")
local xresources    = require("beautiful.xresources")
local dpi           = xresources.apply_dpi

local themes_path = "/home/gabriel/.config/awesome/icons/layouts/"

local theme = {}

-- Default variables
theme.useless_gap                    = dpi(5)
theme.font                           = "FiraCode Nerd Font Bold 8"
theme.bg_normal                      = "#11111b"
theme.bg_focus                       = "#b4befe"
theme.bg_urgent                      = "#11111b"
theme.bg_minimize                    = "#11111b"
theme.fg_normal                      = "#cdd6f4"
theme.fg_focus                       = "#11111b"
theme.fg_urgent                      = "#cdd6f4"
theme.fg_minimize                    = "#cdd6f4"
-- theme.wallpaper = nil
theme.bg_systray                     = "#11111b"
theme.border_color_marked            = "#11111b"
-- theme.border_color_floating          = nil
-- theme.border_color_maximized         = nil
-- theme.border_color_fullscreen        = nil
theme.border_color_active            = "#b4befe"
theme.border_color_normal            = "#11111b"
-- theme.border_color_urgent            = nil
-- theme.border_color_new               = nil
-- theme.border_color_floating_active   = nil
-- theme.border_color_floating_normal   = nil
-- theme.border_color_floating_urgent   = nil
-- theme.border_color_floating_new      = nil
-- theme.border_color_maximized_active  = nil
-- theme.border_color_maximized_normal  = nil
-- theme.border_color_maximized_urgent  = nil
-- theme.border_color_maximized_new     = nil
-- theme.border_color_fullscreen_active = nil
-- theme.border_color_fullscreen_normal = nil
-- theme.border_color_fullscreen_urgent = nil
-- theme.border_color_fullscreen_new    = nil
theme.border_width                   = dpi(3)
-- theme.border_width_floating          = nil
-- theme.border_width_maximized         = nil
-- theme.border_width_normal            = nil
-- theme.border_width_active            = nil
-- theme.border_width_urgent            = nil
-- theme.border_width_new               = nil
-- theme.border_width_floating_normal   = nil
-- theme.border_width_floating_active   = nil
-- theme.border_width_floating_urgent   = nil
-- theme.border_width_floating_new      = nil
-- theme.border_width_maximized_normal  = nil
-- theme.border_width_maximized_active  = nil
-- theme.border_width_maximized_urgent  = nil
-- theme.border_width_maximized_new     = nil
-- theme.border_width_fullscreen_normal = nil
-- theme.border_width_fullscreen_active = nil
-- theme.border_width_fullscreen_urgent = nil
-- theme.border_width_fullscreen_new    = nil
-- theme.border_width_fullscreen        = nil

-- arcchart
-- theme.arcchart_border_color = nil
-- theme.arcchart_color = nil
-- theme.arcchart_border_width = nil
-- theme.arcchart_paddings = nil
-- theme.arcchart_thickness = nil
-- theme.arcchart_rounded_edge = nil
-- theme.arcchart_bg = nil
-- theme.arcchart_start_angle = nil

-- awesome
-- theme.awesome_icon = nil

-- calendar
-- theme.calendar_style = nil
-- theme.calendar_font = nil
-- theme.calendar_spacing = nil
-- theme.calendar_week_numbers = nil
-- theme.calendar_start_sunday = nil
-- theme.calendar_long_weekdays = nil

-- checkbox
-- theme.checkbox_border_width = nil
-- theme.checkbox_bg = nil
-- theme.checkbox_border_color = nil
-- theme.checkbox_check_border_color = nil
-- theme.checkbox_check_border_width = nil
-- theme.checkbox_check_color = nil
-- theme.checkbox_shape = nil
-- theme.checkbox_check_shape = nil
-- theme.checkbox_paddings = nil
-- theme.checkbox_color = nil

-- column
-- theme.column_count = nil

-- cursor
-- theme.cursor_mouse_resize = nil
-- theme.cursor_mouse_move = nil

-- enable
-- theme.enable_spawn_cursor = nil

-- flex
-- theme.flex_height = nil

-- fullscreen
theme.fullscreen_hide_border = true

-- gap
theme.gap_single_client = true

-- graph
-- theme.graph_fg = nil
-- theme.graph_bg = nil
-- theme.graph_border_color = nil

-- hotkeys
theme.hotkeys_bg               = "#11111b"
theme.hotkeys_fg               = "#a6adc8"
theme.hotkeys_border_width     = dpi(3)
theme.hotkeys_border_color     = "#b4befe"
-- theme.hotkeys_shape            = nil
theme.hotkeys_modifiers_fg     = "#cdd6f4"
theme.hotkeys_label_bg         = "#b4befe"
theme.hotkeys_label_fg         = "#11111b"
theme.hotkeys_font             = "FiraCode Nerd Font Bold 8"
theme.hotkeys_description_font = "FiraCode Nerd Font Bold Italic 8"
theme.hotkeys_group_margin     = 10

-- icon
-- theme.icon_theme = nil

-- layout
theme.layout_fairh      = themes_path .. "fairhw.png"
theme.layout_fairv      = themes_path .. "fairvw.png"
theme.layout_floating   = themes_path .. "floatingw.png"
theme.layout_magnifier  = themes_path .. "magnifierw.png"
theme.layout_max        = themes_path .. "maxw.png"
theme.layout_fullscreen = themes_path .. "fullscreenw.png"
theme.layout_tilebottom = themes_path .. "tilebottomw.png"
theme.layout_tileleft   = themes_path .. "tileleftw.png"
theme.layout_tile       = themes_path .. "tilew.png"
theme.layout_tiletop    = themes_path .. "tiletopw.png"
theme.layout_spiral     = themes_path .. "spiralw.png"
theme.layout_dwindle    = themes_path .. "dwindlew.png"
theme.layout_cornernw   = themes_path .. "cornernww.png"
theme.layout_cornerne   = themes_path .. "cornernew.png"
theme.layout_cornersw   = themes_path .. "cornersww.png"
theme.layout_cornerse   = themes_path .. "cornersew.png"

-- layoutlist
-- theme.layoutlist_fg_normal = nil
-- theme.layoutlist_bg_normal = nil
-- theme.layoutlist_fg_selected = nil
-- theme.layoutlist_bg_selected = nil
-- theme.layoutlist_disable_icon = nil
-- theme.layoutlist_disable_name = nil
-- theme.layoutlist_font = nil
-- theme.layoutlist_align = nil
-- theme.layoutlist_font_selected = nil
-- theme.layoutlist_spacing = nil
-- theme.layoutlist_shape = nil
-- theme.layoutlist_shape_border_width = nil
-- theme.layoutlist_shape_border_color = nil
-- theme.layoutlist_shape_selected = nil
-- theme.layoutlist_shape_border_width_selected = nil
-- theme.layoutlist_shape_border_color_selected = nil

-- master
-- theme.master_width_factor = nil
-- theme.master_fill_policy = nil
-- theme.master_count = nil

-- maximized
-- theme.maximized_honor_padding = nil
-- theme.maximized_hide_border = nil

-- menu
-- theme.menu_submenu_icon = nil
theme.menu_font         = "FiraCode Nerd Font Bold 8"
theme.menu_height       = dpi(20)
theme.menu_width        = dpi(120)
theme.menu_border_color = "#b4befe"
theme.menu_border_width = dpi(1)
theme.menu_fg_focus     = "#11111b"
theme.menu_bg_focus     = "#b4befe"
theme.menu_fg_normal    = "#cdd6f4"
theme.menu_bg_normal    = "#11111b"
-- theme.menu_submenu      = nil

-- menubar
-- theme.menubar_fg_normal = nil
-- theme.menubar_bg_normal = nil
-- theme.menubar_border_width = nil
-- theme.menubar_border_color = nil
-- theme.menubar_fg_focus = nil
-- theme.menubar_bg_focus = nil
-- theme.menubar_font = nil

-- notification
-- theme.notification_max_width = nil
-- theme.notification_position = nil
-- theme.notification_action_underline_normal = nil
-- theme.notification_action_underline_selected = nil
-- theme.notification_action_icon_only = nil
-- theme.notification_action_label_only = nil
-- theme.notification_action_shape_normal = nil
-- theme.notification_action_shape_selected = nil
-- theme.notification_action_shape_border_color_normal = nil
-- theme.notification_action_shape_border_color_selected = nil
-- theme.notification_action_shape_border_width_normal = nil
-- theme.notification_action_shape_border_width_selected = nil
-- theme.notification_action_icon_size_normal = nil
-- theme.notification_action_icon_size_selected = nil
-- theme.notification_action_bg_normal = nil
-- theme.notification_action_bg_selected = nil
-- theme.notification_action_fg_normal = nil
-- theme.notification_action_fg_selected = nil
-- theme.notification_action_bgimage_normal = nil
-- theme.notification_action_bgimage_selected = nil
-- theme.notification_shape_normal = nil
-- theme.notification_shape_selected = nil
-- theme.notification_shape_border_color_normal = nil
-- theme.notification_shape_border_color_selected = nil
-- theme.notification_shape_border_width_normal = nil
-- theme.notification_shape_border_width_selected = nil
-- theme.notification_icon_size_normal = nil
-- theme.notification_icon_size_selected = nil
-- theme.notification_bg_normal = nil
-- theme.notification_bg_selected = nil
-- theme.notification_fg_normal = nil
-- theme.notification_fg_selected = nil
-- theme.notification_bgimage_normal = nil
-- theme.notification_bgimage_selected = nil
-- theme.notification_font = nil
-- theme.notification_bg = nil
-- theme.notification_fg = nil
-- theme.notification_border_width = nil
-- theme.notification_border_color = nil
-- theme.notification_shape = nil
-- theme.notification_opacity = nil
-- theme.notification_margin = nil
-- theme.notification_width = nil
-- theme.notification_height = nil
-- theme.notification_spacing = nil
-- theme.notification_icon_resize_strategy = nil
-- theme.notification_icon_size = nil
-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

-- opacity
-- theme.opacity_normal = nil
-- theme.opacity_active = nil
-- theme.opacity_urgent = nil
-- theme.opacity_new = nil
-- theme.opacity_floating_normal = nil
-- theme.opacity_floating_active = nil
-- theme.opacity_floating_urgent = nil
-- theme.opacity_floating_new = nil
-- theme.opacity_floating = nil
-- theme.opacity_maximized_normal = nil
-- theme.opacity_maximized_active = nil
-- theme.opacity_maximized_urgent = nil
-- theme.opacity_maximized_new = nil
-- theme.opacity_maximized = nil
-- theme.opacity_fullscreen_normal = nil
-- theme.opacity_fullscreen_active = nil
-- theme.opacity_fullscreen_urgent = nil
-- theme.opacity_fullscreen_new = nil
-- theme.opacity_fullscreen = nil

-- piechart
-- theme.piechart_border_color = nil
-- theme.piechart_border_width = nil
-- theme.piechart_colors = nil

-- progressbar
-- theme.progressbar_bg = nil
-- theme.progressbar_fg = nil
-- theme.progressbar_shape = nil
-- theme.progressbar_border_color = nil
-- theme.progressbar_border_width = nil
-- theme.progressbar_bar_shape = nil
-- theme.progressbar_bar_border_width = nil
-- theme.progressbar_bar_border_color = nil
-- theme.progressbar_margins = nil
-- theme.progressbar_paddings = nil

-- prompt
-- theme.prompt_fg_cursor = nil
-- theme.prompt_bg_cursor = nil
-- theme.prompt_font      = nil
-- theme.prompt_fg        = nil
-- theme.prompt_bg        = nil

-- radialprogressbar
-- theme.radialprogressbar_border_color = nil
-- theme.radialprogressbar_color = nil
-- theme.radialprogressbar_border_width = nil
-- theme.radialprogressbar_paddings = nil

-- screenshot
-- theme.screenshot_frame_color = nil
-- theme.screenshot_frame_shape = nil

-- separator
-- theme.separator_thickness = nil
-- theme.separator_border_color = nil
-- theme.separator_border_width = nil
-- theme.separator_span_ratio = nil
-- theme.separator_color = nil
-- theme.separator_shape = nil

-- slider
-- theme.slider_bar_border_width = nil
-- theme.slider_bar_border_color = nil
-- theme.slider_handle_border_color = nil
-- theme.slider_handle_border_width = nil
-- theme.slider_handle_width = nil
-- theme.slider_handle_color = nil
-- theme.slider_handle_shape = nil
-- theme.slider_handle_cursor = nil
-- theme.slider_bar_shape = nil
-- theme.slider_bar_height = nil
-- theme.slider_bar_margins = nil
-- theme.slider_handle_margins = nil
-- theme.slider_bar_color = nil
-- theme.slider_bar_active_color = nil

-- snap
-- theme.snap_bg = nil
-- theme.snap_border_width = nil
-- theme.snap_shape = nil

-- snapper
-- theme.snapper_gap = nil

-- systray
-- theme.systray_max_rows = nil
-- theme.systray_icon_spacing = nil

-- taglist
theme.taglist_fg_focus                    = "#11111b"
theme.taglist_bg_focus                    = "#b4befe"
-- theme.taglist_fg_urgent                   = nil
-- theme.taglist_bg_urgent                   = nil
theme.taglist_bg_occupied                 = "#11111b"
theme.taglist_fg_occupied                 = "#cdd6f4"
theme.taglist_bg_empty                    = "#11111b"
theme.taglist_fg_empty                    = "#7f849c"
-- theme.taglist_bg_volatile                 = nil
-- theme.taglist_fg_volatile                 = nil
-- theme.taglist_squares_sel                 = nil
-- theme.taglist_squares_unsel               = nil
-- theme.taglist_squares_sel_empty           = nil
-- theme.taglist_squares_unsel_empty         = nil
-- theme.taglist_squares_resize              = nil
-- theme.taglist_disable_icon                = nil
theme.taglist_font                        = "FiraCode Nerd Font Bold 15"
theme.taglist_spacing                     = 5
-- theme.taglist_shape                       = nil
-- theme.taglist_shape_border_width          = nil
-- theme.taglist_shape_border_color          = nil
-- theme.taglist_shape_empty                 = nil
-- theme.taglist_shape_border_width_empty    = nil
-- theme.taglist_shape_border_color_empty    = nil
-- theme.taglist_shape_focus                 = nil
-- theme.taglist_shape_border_width_focus    = nil
-- theme.taglist_shape_border_color_focus    = nil
-- theme.taglist_shape_urgent                = nil
-- theme.taglist_shape_border_width_urgent   = nil
-- theme.taglist_shape_border_color_urgent   = nil
-- theme.taglist_shape_volatile              = nil
-- theme.taglist_shape_border_width_volatile = nil
-- theme.taglist_shape_border_color_volatile = nil
-- Generate taglist squares:

-- tasklist
-- theme.tasklist_fg_normal                    = nil
-- theme.tasklist_bg_normal                    = nil
theme.tasklist_fg_focus                     = "#cdd6f4"
theme.tasklist_bg_focus                     = "#11111b"
-- theme.tasklist_fg_urgent                    = nil
-- theme.tasklist_bg_urgent                    = nil
-- theme.tasklist_fg_minimize                  = nil
-- theme.tasklist_bg_minimize                  = nil
-- theme.tasklist_bg_image_normal              = nil
-- theme.tasklist_bg_image_focus               = nil
-- theme.tasklist_bg_image_urgent              = nil
-- theme.tasklist_bg_image_minimize            = nil
theme.tasklist_disable_icon                 = true
-- theme.tasklist_disable_task_name            = nil
theme.tasklist_plain_task_name              = false
-- theme.tasklist_sticky                       = nil
-- theme.tasklist_ontop                        = nil
-- theme.tasklist_above                        = nil
-- theme.tasklist_below                        = nil
-- theme.tasklist_floating                     = nil
-- theme.tasklist_maximized                    = nil
-- theme.tasklist_maximized_horizontal         = nil
-- theme.tasklist_maximized_vertical           = nil
-- theme.tasklist_minimized                    = nil
-- theme.tasklist_align                        = nil
theme.tasklist_font                         = "FiraCode Nerd Font Bold 8"
-- theme.tasklist_font_focus                   = nil
-- theme.tasklist_font_minimized               = nil
-- theme.tasklist_font_urgent                  = nil
-- theme.tasklist_spacing                      = nil
-- theme.tasklist_shape                        = nil
-- theme.tasklist_shape_border_width           = nil
-- theme.tasklist_shape_border_color           = nil
-- theme.tasklist_shape_focus                  = nil
-- theme.tasklist_shape_border_width_focus     = nil
-- theme.tasklist_shape_border_color_focus     = nil
-- theme.tasklist_shape_minimized              = nil
-- theme.tasklist_shape_border_width_minimized = nil
-- theme.tasklist_shape_border_color_minimized = nil
-- theme.tasklist_shape_urgent                 = nil
-- theme.tasklist_shape_border_width_urgent    = nil
-- theme.tasklist_shape_border_color_urgent    = nil
-- theme.tasklist_icon_size                    = nil

-- titlebar
-- theme.titlebar_fg_normal = nil
-- theme.titlebar_bg_normal = nil
-- theme.titlebar_bgimage_normal = nil
-- theme.titlebar_fg = nil
-- theme.titlebar_bg = nil
-- theme.titlebar_bgimage = nil
-- theme.titlebar_fg_focus = nil
-- theme.titlebar_bg_focus = nil
-- theme.titlebar_bgimage_focus = nil
-- theme.titlebar_fg_urgent = nil
-- theme.titlebar_bg_urgent = nil
-- theme.titlebar_bgimage_urgent = nil
-- theme.titlebar_floating_button_normal = nil
-- theme.titlebar_maximized_button_normal = nil
-- theme.titlebar_minimize_button_normal = nil
-- theme.titlebar_minimize_button_normal_hover = nil
-- theme.titlebar_minimize_button_normal_press = nil
-- theme.titlebar_close_button_normal = nil
-- theme.titlebar_close_button_normal_hover = nil
-- theme.titlebar_close_button_normal_press = nil
-- theme.titlebar_ontop_button_normal = nil
-- theme.titlebar_sticky_button_normal = nil
-- theme.titlebar_floating_button_focus = nil
-- theme.titlebar_maximized_button_focus = nil
-- theme.titlebar_minimize_button_focus = nil
-- theme.titlebar_minimize_button_focus_hover = nil
-- theme.titlebar_minimize_button_focus_press = nil
-- theme.titlebar_close_button_focus = nil
-- theme.titlebar_close_button_focus_hover = nil
-- theme.titlebar_close_button_focus_press = nil
-- theme.titlebar_ontop_button_focus = nil
-- theme.titlebar_sticky_button_focus = nil
-- theme.titlebar_floating_button_normal_active = nil
-- theme.titlebar_floating_button_normal_active_hover = nil
-- theme.titlebar_floating_button_normal_active_press = nil
-- theme.titlebar_maximized_button_normal_active = nil
-- theme.titlebar_maximized_button_normal_active_hover = nil
-- theme.titlebar_maximized_button_normal_active_press = nil
-- theme.titlebar_ontop_button_normal_active = nil
-- theme.titlebar_ontop_button_normal_active_hover = nil
-- theme.titlebar_ontop_button_normal_active_press = nil
-- theme.titlebar_sticky_button_normal_active = nil
-- theme.titlebar_sticky_button_normal_active_hover = nil
-- theme.titlebar_sticky_button_normal_active_press = nil
-- theme.titlebar_floating_button_focus_active = nil
-- theme.titlebar_floating_button_focus_active_hover = nil
-- theme.titlebar_floating_button_focus_active_press = nil
-- theme.titlebar_maximized_button_focus_active = nil
-- theme.titlebar_maximized_button_focus_active_hover = nil
-- theme.titlebar_maximized_button_focus_active_press = nil
-- theme.titlebar_ontop_button_focus_active = nil
-- theme.titlebar_ontop_button_focus_active_hover = nil
-- theme.titlebar_ontop_button_focus_active_press = nil
-- theme.titlebar_sticky_button_focus_active = nil
-- theme.titlebar_sticky_button_focus_active_hover = nil
-- theme.titlebar_sticky_button_focus_active_press = nil
-- theme.titlebar_floating_button_normal_inactive = nil
-- theme.titlebar_floating_button_normal_inactive_hover = nil
-- theme.titlebar_floating_button_normal_inactive_press = nil
-- theme.titlebar_maximized_button_normal_inactive = nil
-- theme.titlebar_maximized_button_normal_inactive_hover = nil
-- theme.titlebar_maximized_button_normal_inactive_press = nil
-- theme.titlebar_ontop_button_normal_inactive = nil
-- theme.titlebar_ontop_button_normal_inactive_hover = nil
-- theme.titlebar_ontop_button_normal_inactive_press = nil
-- theme.titlebar_sticky_button_normal_inactive = nil
-- theme.titlebar_sticky_button_normal_inactive_hover = nil
-- theme.titlebar_sticky_button_normal_inactive_press = nil
-- theme.titlebar_floating_button_focus_inactive = nil
-- theme.titlebar_floating_button_focus_inactive_hover = nil
-- theme.titlebar_floating_button_focus_inactive_press = nil
-- theme.titlebar_maximized_button_focus_inactive = nil
-- theme.titlebar_maximized_button_focus_inactive_hover = nil
-- theme.titlebar_maximized_button_focus_inactive_press = nil
-- theme.titlebar_ontop_button_focus_inactive = nil
-- theme.titlebar_ontop_button_focus_inactive_hover = nil
-- theme.titlebar_ontop_button_focus_inactive_press = nil
-- theme.titlebar_sticky_button_focus_inactive = nil
-- theme.titlebar_sticky_button_focus_inactive_hover = nil
-- theme.titlebar_sticky_button_focus_inactive_press = nil
-- theme.titlebar_tooltip_messages_close = nil
-- theme.titlebar_tooltip_messages_minimize = nil
-- theme.titlebar_tooltip_messages_maximized_active = nil
-- theme.titlebar_tooltip_messages_maximized_inactive = nil
-- theme.titlebar_tooltip_messages_floating_active = nil
-- theme.titlebar_tooltip_messages_floating_inactive = nil
-- theme.titlebar_tooltip_messages_ontop_active = nil
-- theme.titlebar_tooltip_messages_ontop_inactive = nil
-- theme.titlebar_tooltip_messages_sticky_active = nil
-- theme.titlebar_tooltip_messages_sticky_inactive = nil
-- theme.titlebar_tooltip_delay_show = nil
-- theme.titlebar_tooltip_margins_leftright = nil
-- theme.titlebar_tooltip_margins_topbottom = nil
-- theme.titlebar_tooltip_timeout = nil
-- theme.titlebar_tooltip_align = nil

-- tooltip
-- theme.tooltip_border_color = nil
-- theme.tooltip_bg = nil
-- theme.tooltip_fg = nil
-- theme.tooltip_font = nil
-- theme.tooltip_border_width = nil
-- theme.tooltip_opacity = nil
-- theme.tooltip_gaps = nil
-- theme.tooltip_shape = nil
-- theme.tooltip_align = nil

-- wallpaper
-- theme.wallpaper_bg = nil
-- theme.wallpaper_fg = nil

-- wibar
-- theme.wibar_stretch = nil
-- theme.wibar_favor_vertical = nil
-- theme.wibar_border_width = nil
-- theme.wibar_border_color = nil
-- theme.wibar_ontop = nil
-- theme.wibar_cursor = nil
-- theme.wibar_opacity = nil
-- theme.wibar_type = nil
-- theme.wibar_width = nil
-- theme.wibar_height = nil
-- theme.wibar_bg = nil
-- theme.wibar_bgimage = nil
-- theme.wibar_fg = nil
-- theme.wibar_shape = nil
-- theme.wibar_margins = nil
-- theme.wibar_align = nil

return theme
