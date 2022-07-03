#!/bin/env bash

picom --config $HOME/.config/picom/jonaburg/picom.conf --experimental-backend &
$HOME/.config/polybar/launch.sh &
nitrogen --restore &
