#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# Launch bar
echo "---" | tee -a /tmp/polybar1.log 
polybar mybar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
