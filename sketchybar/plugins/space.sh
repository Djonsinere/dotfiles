#!/bin/sh

# This is taken from josean-dev, he made a great video on it, check out his repo here: 
# https://github.com/josean-dev/dev-environment-files/tree/main/.config/sketchybar

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=0xff57627A  \
                         label.color=$COLOR_WHITE \
                         icon.color=$COLOR_WHITE
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$ACCENT_COLOR \
                         icon.color=$ACCENT_COLOR
fi 