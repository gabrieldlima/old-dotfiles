#!/usr/bin/env bash

if [ $(xdotool getwindowfocus) -eq 1902 ]
then
    echo "bspwm"
else
    xprop -id $(xdotool getactivewindow) WM_CLASS | awk '{print $4}' | tr -d '",'
fi