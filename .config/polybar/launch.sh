#!/bin/env bash

killall -q polybar

polybar -r distro-logo &
polybar -r workspaces &
polybar -r status &
