#!/bin/bash
# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M:%S")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(
    awk '{
    if ($0 == "Charging") {
        print "🔌"
    } else if ($0 == "Discharging") {
        print "⚡"
    } else if ($0 == "Full") {
        print "🔌"
    } else {
        print "Unknown"
    }
    }' /sys/class/power_supply/BAT0/status
)
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)%

# Brightness status
brightness="$(brightnessctl -m | sed 's/,/ /g' | awk '{print $4}') 💡"

# Volume status
volume=$(amixer -M get Master | \
    awk '/Front Left: Playback/ \
        {print $6=="[off]" ? $5" 🔇" : $5" 🔈"}' | \
    tr -d "[]") 

# Emojis and characters for the status bar
# ↑💎 💻 💡 🔌 ⚡ 📁 \|
echo $volume $brightness $battery_level $battery_status $date_formatted
