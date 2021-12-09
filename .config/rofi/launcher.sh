#!/usr/bin/env bash

dir="$HOME/.config/rofi/"
theme="config"

rofi -no-lazy-grab -show drun \
-modi run,drun,window \
-theme $dir/"$theme"

