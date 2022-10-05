#!/bin/env bash

picom --experimental-backend &
nitrogen --restore &
xsetroot -cursor_name left_ptr &
clipit-applet &
$HOME/.config/polybar/launch.sh &
