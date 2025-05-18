#!/usr/bin/env bash

# Проверка: запущен ли Spotify
RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
if [ "$RUNNING" == "" ]; then
  RUNNING=1
fi

PLAYING=1
ICON=""
TRACK=""
ALBUM=""
ARTIST=""

if [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
  PLAYING=0
  ICON="⏸"
fi

if [ $RUNNING -eq 0 ]; then
  TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
  ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')

  if [ "$ARTIST" == "" ]; then
    LABEL="$ICON $TRACK - $ALBUM"
  else
    LABEL="$ICON $TRACK - $ARTIST"
  fi

  sketchybar -m --set $NAME drawing=on label="$LABEL"
else
  sketchybar -m --set $NAME drawing=off label=""
fi