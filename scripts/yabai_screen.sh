#!/bin/bash


string=$(system_profiler SPDisplaysDataType | grep Resolution)
if [[ $string == *"1920 x 1080"* ]]; then
  $(yabai -m config top_padding 30)
else
  $(yabai -m config top_padding 7) 
fi
