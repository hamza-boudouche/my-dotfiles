#!/bin/bash
response=$(printf "No\nYes" | rofi -dmenu -matching fuzzy)
if [[ "$response" == "Yes" ]]; then
    i3lock -i "$HOME/Downloads/great-wave-of-kanagawa-gruvbox-scaled.png" && systemctl suspend
fi
