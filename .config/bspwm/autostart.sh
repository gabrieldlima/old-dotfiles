#!/bin/env bash

picom --experimental-backend &
nitrogen --restore &
nm-applet &
volctl-applet &
clipit-applet &
blueman-applet &
$HOME/.config/polybar/launch.sh &
