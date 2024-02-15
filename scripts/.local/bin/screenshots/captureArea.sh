#!/bin/sh

grim -g "$(slurp)" $HOME/Bilder/Screenshots/$(date +'%s_screenshot.png')

play $HOME/.local/share/hypr/sounds/camera-shutter.ogg
