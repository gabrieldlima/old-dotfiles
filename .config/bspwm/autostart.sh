#!/bin/env bash

picom --experimental-backend &
$HOME/.config/polybar/launch.sh &
nitrogen --restore &
