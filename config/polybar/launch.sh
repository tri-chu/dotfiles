#!/usr/bin/env bash

killall -q polybar

PRIMARY="$(xrandr --query | grep "primary" | cut -d' ' -f1)"

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [ $m == $PRIMARY ]; then
        MONITOR=$m polybar --reload bar1 >>/tmp/polybar1.log 2>&1 & disown
      else
        MONITOR=$m polybar --reload bar2 >>/tmp/polybar$m.log 2>&1 & disown
      fi
  done
else
  polybar --reload bar1 &
fi

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log
# polybar bar1 >>/tmp/polybar1.log 2>&1 & disown
# polybar bar2 >>/tmp/polybar2.log 2>&1 & disown

# echo "Bars launched..."
