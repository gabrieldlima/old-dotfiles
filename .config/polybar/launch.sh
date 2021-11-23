#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# Launch bar
echo "---" | tee -a /tmp/polybar1.log 
polybar example 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
