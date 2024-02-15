#!/bin/sh
#!/bin/bash

grim -g "$(slurp -o)" $HOME/Bilder/Screenshots/$(date +'%s_screenshot.png')

play $HOME/.config/hypr/assets/sounds/camera-shutter.ogg
