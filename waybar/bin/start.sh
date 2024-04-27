#!/bin/sh

# Terminate already running bar instances
killall -q waybar

check() {
	command -v "$1" >/dev/null 2>&1
}

notify() {
	check notify-send && notify-send "$@" || echo "$@"
}

check hyprctl || {
	notify "hyprctl is not present"
	exit 1
}

data="$(hyprctl monitors -j)"
laptop="$(hyprctl monitors -j | jq '.[] | select(.id == 0) | .name')"
readarray -t monitors <<<"$(hyprctl monitors -j | jq '.[] | select(.id != 0) | .name')"
monitor="${monitors[-1]}"

if [ -z "$monitor" ]; then
	monitor="$laptop"
fi

cat <<EOF >"$HOME"/.config/waybar/config

[
  {
  "output": [ $monitor ],
    "include": [
      "~/.config/waybar/config.jsonc",
    ],
  }
]
EOF

setsid waybar &>/dev/null &
