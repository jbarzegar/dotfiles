#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1
echo "---" | tee -a /tmp/polybar1.log
polybar primary 2>&1 | tee -a /tmp/polybar-primary.log & disown

echo "Bars launched..."
