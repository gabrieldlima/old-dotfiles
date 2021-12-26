#!/usr/bin/env bash

dir="$HOME/.config/rofi/"
theme="config"

rofi -no-lazy-grab -show run \
-modi run,drun,window \
-theme $dir/"$theme"

